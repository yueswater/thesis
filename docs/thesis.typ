#let latin-main = "TeX Gyre Pagella"
#let latin-mono = "Roboto"
#let cjk-main = "cwTeX Q Ming"
#let title-font = "TaiwanPearl"
#let heading-font = ("Roboto", title-font)
#let cite-style = "apa"
#let cite-blue = rgb("#0000ff")
#let impt-cjk-font = "cwTeX Q Hei"
#let impt-latin-font = "Roboto"

#let pad2(value) = if value < 10 { "0" + str(value) } else { str(value) }
#let date-ymd(date) = str(date.year()) + "/" + pad2(date.month()) + "/" + pad2(date.day())
#let has-cjk(body) = repr(body).contains(regex("[一-龥㐀-䶿豈-﫿]"))
#let impt(body) = text(
  font: if has-cjk(body) { impt-cjk-font } else { impt-latin-font },
  weight: "bold",
)[#body]

#let term(chinese, english: none) = {
  text(font: title-font, size: 11pt)[#chinese]
  if english != none {
    [ (]
    text(font: latin-main)[#english]
    [)]
  }
}

#let heading-size = 13pt

#let thesis-heading(it, above, below) = block(above: above, below: below)[
  #if it.numbering != none [
    #text(font: heading-font, size: heading-size, weight: "light")[
      #counter(heading).display(it.numbering)
    ]
    #h(0.45em)
  ]
  #text(font: heading-font, size: heading-size, weight: "light")[#it.body]
]

#let c(key, supplement: none) = cite(
  label(key),
  supplement: supplement,
  form: "prose",
)
#let cp(key, supplement: none) = cite(label(key), supplement: supplement)
#let ca(key) = cite(label(key), form: "author")
#let cy(key) = cite(label(key), form: "year")
#let SS = math.upright("SS")
#let UI = math.upright("UI")
#let IU = math.upright("IU")
#let widetilde(body) = math.accent(body, "\u{0303}", size: 140%)
#let corr = math.op("corr")
#let bern = math.op("Bernoulli")
#let qed-symbol = [#h(1fr)$square.stroked$]
#let qed = qed-symbol
#let theorem-font = "TaiwanPearl"
#let headingref(target) = context {
  let elem = query(target).at(0)
  let loc = elem.location()
  let nums = counter(heading).at(loc)
  if elem.level == 1 {
    link(loc)[#text(fill: cite-blue)[第 #nums.at(0) 章]]
  } else {
    link(loc)[#text(fill: cite-blue)[第 #nums.at(0) 章第 #nums.at(1) 小節]]
  }
}
#let stmtref(lbl, kind, key) = context {
  let loc = query(lbl).first().location()
  let no = counter(key).at(loc).at(0) + 1
  link(loc)[#text(fill: cite-blue)[#kind #no]]
}
#let is-blank(t) = t == none or t == [] or t == ""
#let statement(kind, key, body, title: none, above: 1.2em, below: 1em) = context {
  let ctr = counter(key)
  ctr.step()
  let no = str(ctr.get().at(0) + 1)
  block(above: above, below: 0pt)[
    #set math.equation(numbering: none)
    #set par(first-line-indent: 0em)
    #text(font: theorem-font, weight: "light")[
      #kind #no#if not is-blank(title) [
        #h(0.1em)
        #text(font: theorem-font, weight: "light")[(]#title#text(font: theorem-font, weight: "light")[)]
      ]
    ]
    #h(0.5em)
    #body
  ]
  v(below, weak: true)
  par(h(0pt, weak: true))
}
#let definition(body, title: none) = statement("定義", "definition-counter", body, title: title)
#let lemma(body, title: none) = statement("引理", "lemma-counter", body, title: title)
#let theorem(body, title: none) = statement("定理", "theorem-counter", body, title: title)
#let proposition(body, title: none) = statement("命題", "proposition-counter", body, title: title)
#let corollary(body, title: none) = statement("推論", "corollary-counter", body, title: title)
#let example(body, title: none) = statement("範例", "example-counter", body, title: title, below: 1em)
#let proof(body, qed: true) = {
  v(1em, weak: true)
  block(below: 0pt)[
    #set math.equation(numbering: none)
    #set par(first-line-indent: 2em)
    #text(font: theorem-font, weight: "light")[證明]#h(0.5em)#body
    #if qed [#qed-symbol]
  ]
  v(1em, weak: true)
  par(h(0pt, weak: true))
}
#let payoff-matrix-2x2(
  row_player,
  col_player,
  row_actions: ([A], [B]),
  col_actions: ([A], [B]),
  payoffs: (([$(x,y)$], [$(x,y)$]), ([$(x,y)$], [$(x,y)$])),
  columns: (2.6cm, 1.8cm, 2.6cm, 2.6cm),
  inset: 6pt,
  stroke: 0.5pt,
) = text(font: heading-font, weight: "light")[
  #table(
    columns: columns,
    inset: inset,
    align: (col, row) => center + horizon,
    stroke: none,
    table.vline(x: 2, start: 2, stroke: stroke),
    table.vline(x: 3, start: 2, stroke: stroke),
    table.vline(x: 4, start: 2, stroke: stroke),
    table.hline(y: 2, start: 2, stroke: stroke),
    table.hline(y: 3, start: 2, stroke: stroke),
    table.hline(y: 4, start: 2, stroke: stroke),
    [],
    [],
    table.cell(colspan: 2)[#col_player],
    [],
    [],
    [#col_actions.at(0)],
    [#col_actions.at(1)],
    table.cell(rowspan: 2)[#row_player],
    [#row_actions.at(0)],
    [#payoffs.at(0).at(0)],
    [#payoffs.at(0).at(1)],
    [#row_actions.at(1)],
    [#payoffs.at(1).at(0)],
    [#payoffs.at(1).at(1)],
  )
]

#let thesis(
  title: "碩士論文草稿",
  subtitle: none,
  author: "宋品岳",
  date: datetime.today(),
  bib: "refs.bib",
  body,
) = {
  set document(title: title, author: author)
  set page(
    paper: "a4",
    margin: (
      top: 1in,
      bottom: 1in,
      left: 1.5in,
      right: 1.5in,
    ),
    numbering: "1",
  )
  set text(
    lang: "en",
    region: "US",
    size: 12pt,
    font: (latin-main, cjk-main),
  )
  set par(
    justify: true,
    leading: 1em,
    first-line-indent: 2em,
  )
  set heading(numbering: "1.1")
  show heading.where(level: 4): set heading(numbering: none)
  set math.equation(numbering: none, supplement: [式])
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      let n = counter(math.equation).at(it.element.location()).first()
      link(it.element.location())[式 (#n)]
    } else {
      it
    }
  }
  show footnote.entry: set par(leading: 12pt)
  show raw: set text(font: latin-mono)
  show cite: set text(fill: cite-blue)
  show ref: set text(fill: cite-blue)
  show figure: it => {
    block(below: 1em)[#it]
    par(h(0pt, weak: true))
  }
  show figure.caption: it => context [
    #text(font: heading-font, weight: "light")[#it.supplement #it.counter.display(it.numbering)]#h(0.5em)#it.body
  ]
  show heading.where(level: 1): it => thesis-heading(it, 1em, 1em)
  show heading.where(level: 2): it => thesis-heading(it, 1em, 1em)
  show heading.where(level: 3): it => thesis-heading(it, 1em, 1em)
  show heading.where(level: 4): it => block(above: 0.8em, below: 0.6em)[
    #text(font: heading-font, size: 12pt, weight: "light")[#it.body]
  ]

  align(center)[
    #text(font: title-font, size: 18pt, weight: "light")[#title]
    #if subtitle != none [
      #v(0.4em)
      #text(font: title-font, size: 16pt, weight: "light")[#subtitle]
    ]
    #v(0.9em)
    #text(size: 14pt)[#author]
    #if date != none [
      #v(0.6em)
      #text(size: 12pt)[#date-ymd(date)]
    ]
  ]

  v(1.8em)

  body
  pagebreak()

  text(lang: "en", region: "US")[
    #bibliography(
      bib,
      title: [參考文獻],
      style: cite-style,
    )
  ]
}
