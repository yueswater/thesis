#let latin-main = "TeX Gyre Pagella"
#let latin-mono = "Roboto"
#let cjk-main = "cwTeX Q Ming"
#let title-font = "TaiwanPearl"
#let heading-font = ("Roboto", title-font)
#let cite-style = "apa"
#let cite-blue = rgb("#0000ff")

#let pad2(value) = if value < 10 { "0" + str(value) } else { str(value) }
#let date-ymd(date) = str(date.year()) + "/" + pad2(date.month()) + "/" + pad2(date.day())

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
#let widetilde(body) = math.accent(body, "\u{0303}", size: 140%)
#let qed-symbol = block(width: 100%)[#align(right)[$square.stroked$]]
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
#let statement(kind, key, body, title: none, above: 1.2em, below: 0.6em) = context {
  let ctr = counter(key)
  ctr.step()
  let no = str(ctr.get().at(0) + 1)
  block(above: above, below: below)[
    #set par(first-line-indent: 0em)
    #text(font: theorem-font, weight: "light")[
      #kind #no#if title != none [
        #h(0.1em)
        #text(font: theorem-font, weight: "light")[(]#title#text(font: theorem-font, weight: "light")[)]
      ]
    ]
    #h(0.5em)
    #body
  ]
}
#let definition(body, title: none) = statement("定義", "definition-counter", body, title: title)
#let lemma(body, title: none) = statement("引理", "lemma-counter", body, title: title)
#let theorem(body, title: none) = statement("定理", "theorem-counter", body, title: title)
#let proposition(body, title: none) = statement("命題", "proposition-counter", body, title: title)
#let example(body, title: none) = statement("範例", "example-counter", body, title: title, below: 1em)
#let proof(body, qed: true) = block(above: 1.5em, below: 0.5em)[
  #set par(first-line-indent: 2em)
  #text(font: theorem-font, weight: "light")[證明]#h(0.5em)#body
  #if qed [#qed-symbol]
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
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      let n = counter(math.equation).at(it.element.location()).first()
      link(it.element.location())[式 (#n)]
    } else {
      it
    }
  }
  show raw: set text(font: latin-mono)
  show cite: set text(fill: cite-blue)
  show ref: set text(fill: cite-blue)
  show figure: it => block(below: 1em)[#it]
  show heading.where(level: 1): it => thesis-heading(it, 1.4em, 0.9em)
  show heading.where(level: 2): it => thesis-heading(it, 1.1em, 0.7em)
  show heading.where(level: 3): it => thesis-heading(it, 0.9em, 0.6em)

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
