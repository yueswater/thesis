#let latin-main = "TeX Gyre Pagella"
#let latin-mono = "Roboto"
#let cjk-main = "cwTeX Q Ming"
#let title-font = "cwTeX Q Yuan"
#let heading-font = ("Roboto", title-font)
#let cite-style = "chicago-author-date"
#let cite-blue = rgb("#0000ff")

#let pad2(value) = if value < 10 { "0" + str(value) } else { str(value) }
#let date-ymd(date) = str(date.year()) + "/" + pad2(date.month()) + "/" + pad2(date.day())

#let heading-size = 13pt

#let thesis-heading(it, above, below) = block(above: above, below: below)[
  #if it.numbering != none [
    #text(font: heading-font, size: heading-size, weight: "regular")[
      #counter(heading).display(it.numbering)
    ]
    #h(0.45em)
  ]
  #text(font: heading-font, size: heading-size, weight: "regular")[#it.body]
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
#let theorem-font = "Roboto"
#let statement(kind, key, body, title: none) = context {
  let ctr = counter(key)
  ctr.step()
  let no = str(ctr.get().at(0) + 1)
  block(above: 1.2em, below: 0.6em)[
    #set par(first-line-indent: 0em)
    #text(font: theorem-font, weight: 500)[
      #kind #no#if title != none [ (#title) ]
    ]
    #h(0.5em)
    #body
  ]
}
#let definition(body, title: none) = statement("Definition", "definition-counter", body, title: title)
#let lemma(body, title: none) = statement("Lemma", "lemma-counter", body, title: title)
#let theorem(body, title: none) = statement("Theorem", "theorem-counter", body, title: title)
#let proposition(body, title: none) = statement("Proposition", "proposition-counter", body, title: title)
#let proof(body, qed: true) = block(above: 1.5em, below: 0.5em)[
  #set par(first-line-indent: 0em)
  #text(font: theorem-font, weight: 500)[Proof]#h(0.5em)#body
  #if qed [#qed-symbol]
]

#let thesis(
  title: "Master's Thesis Draft",
  subtitle: none,
  author: "Pin-Yueh Sung",
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
  show raw: set text(font: latin-mono)
  show cite: set text(fill: cite-blue)
  show ref: set text(fill: cite-blue)
  show heading.where(level: 1): it => thesis-heading(it, 1.4em, 0.9em)
  show heading.where(level: 2): it => thesis-heading(it, 1.1em, 0.7em)
  show heading.where(level: 3): it => thesis-heading(it, 0.9em, 0.6em)

  align(center)[
    #text(font: title-font, size: 18pt, weight: "bold")[#title]
    #if subtitle != none [
      #v(0.4em)
      #text(font: title-font, size: 16pt, weight: "regular")[#subtitle]
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
      title: [References],
      style: cite-style,
    )
  ]
}
