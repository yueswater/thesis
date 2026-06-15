#!/usr/bin/env python3
import argparse
import shutil
import subprocess
import sys
from datetime import datetime
from pathlib import Path


ROOT = Path.cwd()
BASE = ROOT / ".ai-team"
TRANSCRIPTS = BASE / "transcripts"


CONTEXT_FILES = [
    "README.md",
    "thesis-context.md",
    "roles.md",
    "rules.md",
]


def read_file(path: Path) -> str:
    if not path.exists():
        return f"[Missing file: {path}]"
    return path.read_text(encoding="utf-8")


def build_shared_context() -> str:
    parts = []
    for filename in CONTEXT_FILES:
        path = BASE / filename
        parts.append(f"# File: .ai-team/{filename}\n\n{read_file(path)}")
    return "\n\n---\n\n".join(parts)


def ensure_cli(name: str) -> None:
    if shutil.which(name) is None:
        raise RuntimeError(f"Cannot find CLI: {name}")


def run_command(cmd: list[str], stdin_text: str | None = None) -> str:
    result = subprocess.run(
        cmd,
        input=stdin_text,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    if result.returncode != 0:
        raise RuntimeError(
            "Command failed:\n"
            + " ".join(cmd)
            + "\n\nSTDERR:\n"
            + result.stderr
        )

    return result.stdout.strip()


def save_transcript(stamp: str, name: str, content: str) -> Path:
    TRANSCRIPTS.mkdir(parents=True, exist_ok=True)
    path = TRANSCRIPTS / f"{stamp}-{name}.md"
    path.write_text(content, encoding="utf-8")
    return path


def call_claude(role: str, task: str, shared_context: str, discussion: str) -> str:
    prompt = f"""
你是 AI thesis team 中的「{role}」。

請根據以下共同背景與既有討論，回應目前任務。

# 共同背景

{shared_context}

# 使用者任務

{task}

# 目前討論紀錄

{discussion}

# 請輸出

1. 一句話判斷
2. 你的分析
3. 你對前面討論的質疑或補強
4. 具體建議
5. 下一步應該交給誰處理
""".strip()

    return run_command(
        [
            "claude",
            "-p",
            prompt,
            "--permission-mode",
            "plan",
            "--output-format",
            "text",
        ]
    )


def call_codex(role: str, task: str, shared_context: str, discussion: str) -> str:
    prompt = f"""
你是 AI thesis team 中的「{role}」。

請根據以下共同背景與既有討論，回應目前任務。

# 共同背景

{shared_context}

# 使用者任務

{task}

# 目前討論紀錄

{discussion}

# 請輸出

1. 一句話判斷
2. 形式化檢查或工程化檢查
3. 可能的數學錯誤、符號錯誤、推論跳躍
4. 若需要計算，提出可重現的檢查方法
5. 具體下一步
""".strip()

    return run_command(
        [
            "codex",
            "exec",
            "-C",
            str(ROOT),
            "--sandbox",
            "read-only",
            prompt,
        ]
    )


def final_synthesis(task: str, shared_context: str, discussion: str) -> str:
    prompt = f"""
你是 AI thesis team 的最終整理者。

請綜合 Claude 與 Codex 的討論，產生一份可以直接給作者決策的方案。

# 共同背景

{shared_context}

# 使用者任務

{task}

# 完整討論紀錄

{discussion}

# 最終輸出格式

## 一句話結論

## 診斷

## 建議方案

## 形式化／數學上還需要補的步驟

## 寫作上應如何安排

## 風險與未解問題

## 下一個最小任務
""".strip()

    return run_command(
        [
            "claude",
            "-p",
            prompt,
            "--permission-mode",
            "plan",
            "--output-format",
            "text",
        ]
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Run a local Claude + Codex thesis discussion team."
    )
    parser.add_argument("task", nargs="+", help="Task for the AI team.")
    parser.add_argument(
        "--rounds",
        type=int,
        default=1,
        help="Number of critique rounds before final synthesis. Default: 1.",
    )
    args = parser.parse_args()

    task = " ".join(args.task)
    stamp = datetime.now().strftime("%Y%m%d-%H%M%S")

    try:
        ensure_cli("claude")
        ensure_cli("codex")

        shared_context = build_shared_context()
        discussion = ""

        print("== AI Team started ==")
        print(f"Task: {task}")
        print()

        for r in range(1, args.rounds + 1):
            print(f"Round {r}.1: Claude theorist / architect")
            claude_reply = call_claude(
                role="理論架構師",
                task=task,
                shared_context=shared_context,
                discussion=discussion,
            )
            save_transcript(stamp, f"{r:02d}-claude-architect", claude_reply)
            discussion += f"\n\n# Round {r}: Claude architect\n\n{claude_reply}\n"

            print(f"Round {r}.2: Codex formal checker")
            codex_reply = call_codex(
                role="形式化與計算檢查者",
                task=task,
                shared_context=shared_context,
                discussion=discussion,
            )
            save_transcript(stamp, f"{r:02d}-codex-checker", codex_reply)
            discussion += f"\n\n# Round {r}: Codex checker\n\n{codex_reply}\n"

            print(f"Round {r}.3: Claude skeptic")
            skeptic_reply = call_claude(
                role="反方 reviewer",
                task=task,
                shared_context=shared_context,
                discussion=discussion,
            )
            save_transcript(stamp, f"{r:02d}-claude-skeptic", skeptic_reply)
            discussion += f"\n\n# Round {r}: Claude skeptic\n\n{skeptic_reply}\n"

        print("Final: synthesis")
        final = final_synthesis(
            task=task,
            shared_context=shared_context,
            discussion=discussion,
        )

        final_path = BASE / "final.md"
        full_transcript_path = BASE / "last-discussion.md"

        final_path.write_text(final, encoding="utf-8")
        full_transcript_path.write_text(discussion, encoding="utf-8")
        save_transcript(stamp, "final", final)

        print()
        print("== FINAL ==")
        print()
        print(final)
        print()
        print(f"Saved final answer to: {final_path}")
        print(f"Saved full discussion to: {full_transcript_path}")

    except RuntimeError as e:
        print()
        print("AI Team failed.")
        print(str(e))
        sys.exit(1)


if __name__ == "__main__":
    main()