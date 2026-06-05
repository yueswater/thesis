#!/usr/bin/env python3
from __future__ import annotations

import argparse
import html
import json
import shutil
import signal
import subprocess
import sys
import threading
import time
import webbrowser
from http import HTTPStatus
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import quote, urlparse


INDEX_TEMPLATE = """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{title}</title>
  <style>
    * {{
      box-sizing: border-box;
    }}

    html,
    body {{
      height: 100%;
      margin: 0;
      color: #171717;
      background: #f5f5f5;
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    }}

    body {{
      display: grid;
      grid-template-rows: auto 1fr;
    }}

    header {{
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 16px;
      min-height: 48px;
      padding: 8px 14px;
      border-bottom: 1px solid #d4d4d4;
      background: #ffffff;
    }}

    .title {{
      overflow: hidden;
      min-width: 0;
      font-weight: 650;
      text-overflow: ellipsis;
      white-space: nowrap;
    }}

    .status {{
      flex: 0 0 auto;
      color: #525252;
      font-size: 14px;
    }}

    main {{
      position: relative;
      min-height: 0;
    }}

    iframe {{
      width: 100%;
      height: 100%;
      border: 0;
      background: #ffffff;
    }}

    .empty {{
      position: absolute;
      inset: 0;
      display: grid;
      place-items: center;
      padding: 24px;
      color: #525252;
      text-align: center;
    }}

    [hidden] {{
      display: none !important;
    }}
  </style>
</head>
<body>
  <header>
    <div class="title">{pdf_name}</div>
    <div class="status" id="status">Waiting for PDF...</div>
  </header>
  <main>
    <iframe id="viewer" title="{pdf_name}" hidden></iframe>
    <div class="empty" id="empty">Waiting for the first PDF build.</div>
  </main>
  <script>
    const viewer = document.getElementById("viewer");
    const empty = document.getElementById("empty");
    const statusEl = document.getElementById("status");
    const pdfUrl = "{pdf_url}";
    let currentSignature = "";

    function showPdf(signature) {{
      viewer.src = `${{pdfUrl}}?rev=${{encodeURIComponent(signature)}}`;
      viewer.hidden = false;
      empty.hidden = true;
    }}

    async function refresh() {{
      try {{
        const response = await fetch("/status", {{ cache: "no-store" }});
        if (!response.ok) throw new Error(`status ${{response.status}}`);
        const state = await response.json();

        if (!state.exists) {{
          statusEl.textContent = state.typst_running ? "Building PDF..." : "Typst stopped";
          viewer.hidden = true;
          empty.hidden = false;
          return;
        }}

        const signature = `${{state.mtime_ns}}-${{state.size}}`;
        if (signature !== currentSignature) {{
          currentSignature = signature;
          showPdf(signature);
        }}

        statusEl.textContent = state.typst_running ? "Watching PDF" : "Typst stopped";
      }} catch (error) {{
        statusEl.textContent = "Preview server unavailable";
      }}
    }}

    refresh();
    setInterval(refresh, 1000);
  </script>
</body>
</html>
"""


class PreviewState:
    def __init__(self, pdf_path: Path, process: subprocess.Popen[list[str]]) -> None:
        self.pdf_path = pdf_path
        self.process = process


class PreviewHandler(BaseHTTPRequestHandler):
    server_version = "TypstPdfPreview/0.1"
    state: PreviewState

    def log_message(self, fmt: str, *args: object) -> None:
        sys.stderr.write("%s - %s\n" % (self.log_date_time_string(), fmt % args))

    def do_GET(self) -> None:
        route = urlparse(self.path).path
        if route in {"/", "/index.html"}:
            self._serve_index()
        elif route == "/status":
            self._serve_status()
        elif route == self._pdf_route():
            self._serve_pdf()
        else:
            self.send_error(HTTPStatus.NOT_FOUND)

    def _serve_index(self) -> None:
        pdf_name = self.state.pdf_path.name
        document = INDEX_TEMPLATE.format(
            title=html.escape(f"{pdf_name} preview"),
            pdf_name=html.escape(pdf_name),
            pdf_url=self._pdf_route(),
        ).encode("utf-8")
        self.send_response(HTTPStatus.OK)
        self._send_no_cache_headers()
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.send_header("Content-Length", str(len(document)))
        self.end_headers()
        self.wfile.write(document)

    def _serve_status(self) -> None:
        payload = self._file_signature()
        return_code = self.state.process.poll()
        payload["typst_running"] = return_code is None
        payload["typst_exit_code"] = return_code
        data = json.dumps(payload).encode("utf-8")

        self.send_response(HTTPStatus.OK)
        self._send_no_cache_headers()
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def _serve_pdf(self) -> None:
        try:
            stat = self.state.pdf_path.stat()
        except FileNotFoundError:
            self.send_error(HTTPStatus.NOT_FOUND, "PDF has not been built yet")
            return

        self.send_response(HTTPStatus.OK)
        self._send_no_cache_headers()
        self.send_header("Content-Type", "application/pdf")
        self.send_header("Content-Disposition", f'inline; filename="{self.state.pdf_path.name}"')
        self.send_header("Content-Length", str(stat.st_size))
        self.end_headers()

        with self.state.pdf_path.open("rb") as pdf_file:
            shutil.copyfileobj(pdf_file, self.wfile)

    def _send_no_cache_headers(self) -> None:
        self.send_header("Cache-Control", "no-store, max-age=0")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")

    def _file_signature(self) -> dict[str, int | bool]:
        try:
            stat = self.state.pdf_path.stat()
        except FileNotFoundError:
            return {"exists": False, "mtime_ns": 0, "size": 0}
        return {"exists": True, "mtime_ns": stat.st_mtime_ns, "size": stat.st_size}

    def _pdf_route(self) -> str:
        return "/" + quote(self.state.pdf_path.name)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Serve a live-reloading PDF preview around a watch command.")
    parser.add_argument("--host", default="127.0.0.1", help="Host to bind. Defaults to 127.0.0.1.")
    parser.add_argument("--port", type=int, default=9955, help="Port to bind. Defaults to 9955.")
    parser.add_argument("--pdf", default="main.pdf", help="PDF path to serve. Defaults to main.pdf.")
    parser.add_argument("--open", action="store_true", dest="open_browser", help="Open the preview in a browser.")
    parser.add_argument("cmd", nargs=argparse.REMAINDER, help="Watch command to run after --.")
    args = parser.parse_args()

    if args.cmd and args.cmd[0] == "--":
        args.cmd = args.cmd[1:]
    if not args.cmd:
        parser.error("missing watch command after --")

    return args


def open_browser_later(host: str, port: int) -> None:
    browser_host = "127.0.0.1" if host in {"0.0.0.0", "::"} else host
    url = f"http://{browser_host}:{port}/"
    threading.Timer(0.5, lambda: webbrowser.open(url)).start()


def terminate(process: subprocess.Popen[list[str]]) -> None:
    if process.poll() is not None:
        return

    process.terminate()
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()


def raise_keyboard_interrupt(_signum: int, _frame: object) -> None:
    raise KeyboardInterrupt


def main() -> int:
    args = parse_args()
    pdf_path = Path(args.pdf).resolve()

    try:
        server = ThreadingHTTPServer((args.host, args.port), PreviewHandler)
    except OSError as error:
        print(f"Could not bind http://{args.host}:{args.port}/: {error}", file=sys.stderr)
        return 1

    try:
        process = subprocess.Popen(args.cmd)
    except OSError as error:
        server.server_close()
        print(f"Could not start watch command: {error}", file=sys.stderr)
        return 1

    PreviewHandler.state = PreviewState(pdf_path=pdf_path, process=process)

    signal.signal(signal.SIGTERM, raise_keyboard_interrupt)

    url = f"http://{args.host}:{args.port}/"
    print(f"PDF preview serving at {url}", file=sys.stderr)
    if args.open_browser:
        open_browser_later(args.host, args.port)

    try:
        server.serve_forever(poll_interval=0.25)
    except KeyboardInterrupt:
        print("\nStopping PDF preview.", file=sys.stderr)
    finally:
        server.server_close()
        terminate(process)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
