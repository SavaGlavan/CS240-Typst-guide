#let title = [Typst for CS240]

#set page("us-letter", numbering: "1")

#show raw: it => block(
  fill: luma(230),
  inset: 8pt,
  radius: 5pt,
  text(it)
)

#show link: it => {
  set text(blue)
  underline(it)
}

#align(center, text(17pt)[
  *#title*
])

#set heading(numbering: "1.")

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

#outline(indent: auto)
#pagebreak()
#include "section/introduction.typ"
#pagebreak()
#include "section/pseudo_code.typ"
#pagebreak()
#include "section/trees.typ"
#pagebreak()
#include "section/skiplists.typ"
#pagebreak()
#include "section/contribution.typ"
