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

#outline()
#pagebreak()
#include "introduction.typ"
#pagebreak()
#include "formatting.typ"
#pagebreak()
#include "pseudo_code.typ"
#pagebreak()
#include "trees.typ"
#pagebreak()
#include "skiplists.typ"
#pagebreak()
#include "contribution.typ"
