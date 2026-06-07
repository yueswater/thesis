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

= 問題意識與基準模型 <sec-model>

#include "chapters/03_motivation_benchmark.typ"

= 核心模型 <sec-analysis>

#include "chapters/04_main_model.typ"

= 延伸討論 <sec-extension>

#include "chapters/05_extension_placeholder.typ"

#pagebreak()

#[
  #set heading(numbering: "A.1", supplement: [附錄])
  #counter(heading).update(0)

  = 附錄：證明 <sec-appendix>

  #include "chapters/08_appendix_placeholder.typ"
]
