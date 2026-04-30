#import "thesis.typ": thesis

#show: thesis.with(
  title: "Separation, Pooling, and Endogenous Timing under Two-sided Asymmetry",
  author: "Pin Yue Sung",
  bib: "refs.bib",
)

= Introduction <sec-intro>

#include "chapters/01_intro.typ"

= Literature Review <sec-literature>

#include "chapters/02_literatures.typ"

= Model Setup <sec-model>

#include "chapters/03_model.typ"

= Equilibrium Analysis <sec-equilibria>

#include "chapters/04_equilibria.typ"

= Endogenous Timing Choice <sec-analysis>

#include "chapters/05_analysis.typ"

= Extension: Partially Correlated Types <sec-extension>

#include "chapters/06_extension.typ"

#pagebreak()

#[
  #set heading(numbering: "A.1", supplement: [Appendix])
  #counter(heading).update(0)

  = Appendix: Proofs <sec-appendix>

  #include "chapters/08_appendix.typ"
]
