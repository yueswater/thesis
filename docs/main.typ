#import "thesis.typ": thesis

#show: thesis.with(
  title: "雙重不對稱下的分離、扭曲與內生時序",
  author: "宋品岳",
  bib: ("refs.bib", "refs_extra.yml"),
)

= 緒論 <sec-intro>

#include "chapters/01_intro.typ"

= 文獻回顧 <sec-literature>

#include "chapters/02_literature.typ"

= 獨立同分配基準模型 <sec-model>

#include "chapters/03_benchmark.typ"

= 核心模型 <sec-analysis>

#include "chapters/04_main_model.typ"

= 福利分析 <sec-welfare>

#include "chapters/05_welfare.typ"

#set heading(numbering: "A.1")
#counter(heading).update(0)

= 附錄 <sec-appendix>

#include "chapters/08_appendix.typ"
