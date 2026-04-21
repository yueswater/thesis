#import "thesis.typ": thesis

#show: thesis.with(
  title: "雙重不對稱下的分離、混同與內生時序",
  author: "宋品岳",
  bib: "refs.bib",
)

= 緒論 <sec-intro>

#include "chapters/01_intro.typ"

= 文獻回顧 <sec-literature>

#include "chapters/02_literatures.typ"

= 模型設定 <sec-model>

#include "chapters/03_model.typ"

= 均衡分析 <sec-equilibria>

#include "chapters/04_equilibria.typ"

= 內生時序選擇 <sec-analysis>

#include "chapters/05_analysis.typ"

#pagebreak()

#[
  #set heading(numbering: "A.1", supplement: [附錄])
  #counter(heading).update(0)

  = 附錄：證明 <sec-appendix>

  #include "chapters/08_appendix.typ"
]
