#let title = [Typst for CS240]

#set page("us-letter", numbering: "1", margin: (x: 2cm, y: 2cm))

#show raw: it => block(
  fill: luma(230),
  inset: 8pt,
  radius: 5pt,
  text(it)
)

#show link: it => {
  set text(blue)
  underline(it)}

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
#include "sections/introduction.typ"
#pagebreak()
#include "sections/pseudo_code.typ"
#pagebreak()
#include "sections/trees.typ"
#pagebreak()
#include "sections/skiplists.typ"
#pagebreak()
#include "sections/contribution.typ"
