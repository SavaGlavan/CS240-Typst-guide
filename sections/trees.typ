= Trees
#import "@preview/cetz:0.2.2": *
#import "@preview/diagraph:0.3.0": *

== Binary tree
Using the #link("https://typst.app/universe/package/cetz/")[*cetz*] package we can draw binary trees:

```typst
#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),)

  tree.tree(
    (
      [$8$], // root node
      (
        [$5$],
        (
          [$4$],
          (
            [$2$],
          ),
        ),
        (
          [$1$],
        ),
    ),
      (
        [$7$],
        (
          [$6$],
        ),
        (
          [$3$],
        ),
      ),
  )
)
})
```
Which creates the following binary tree:
#canvas(length: 1cm, {
  import draw: *

  set-style(content: (padding: .2),
    fill: gray.lighten(70%),
    )

  tree.tree(
    (
      [$8$],
      (
        [$5$],
        (
          [$4$],
          (
            [$2$],
          ),
        ),
        (
          [$1$],
        ),
    ),
      (
        [$7$],
        (
          [$6$],
        ),
        (
          [$3$],
        ),
      ),
  )
)
})
#pagebreak()
== AVL tree
We can use the #link("https://typst.app/universe/package/diagraph/")[*diagraph*] package to draw AVL trees:
```typst
// import the diagraph package
#import "@preview/diagraph:0.3.0": *

// create a template for our nodes that will allow us to have value and balance
#let node(val, bal) = {
  table(
    stroke: none,
    columns: (auto),
    align: center,
    [#val],
    table.hline(),
    [#bal]
  )
}

#raw-render(
//    replace this comment with 3 backticks -> `
              digraph G{
              // decide shape for each node
              a [shape=circle]
              b [shape=circle]
              c [shape=circle]
              d [shape=circle]
              A [shape=triangle]
              B [shape=triangle]
              D [shape=triangle]
              E [shape=triangle]
              // make an edge between nodes
              c -> b
              c -> d
              b -> a
              a -> A
              a -> B
              d -> D
              // you may have to declare some nodes later in the interest of ordering
              C [shape=triangle]
              d -> E
              b -> C
              }
//    replace this comment with 3 backticks -> `
            ,
            // label the nodes, this is where we apply our template
            labels: (
              "b": [#node("b", "-1")],
              "a": [#node("a", 0)],
              "c": [#node("c", "-1")],
              "d": [#node("d", 0)]
            )
          )
```
Creates the following AVL tree:

#let node(val, bal) = {
  table(
    stroke: none,
    columns: (auto),
    align: center,
    [#val],
    table.hline(),
    [#bal]
  )
}
#raw-render(
            ```
              digraph G{
              a [shape=circle]
              b [shape=circle]
              c [shape=circle]
              d [shape=circle]
              A [shape=triangle]
              B [shape=triangle]
              D [shape=triangle]
              E [shape=triangle]
              c -> b
              c -> d
              b -> a
              a -> A
              a -> B
              d -> D
              C [shape=triangle]
              d -> E
              b -> C
              }
            ```,
            labels: (
              "b": [#node("b", "-1")],
              "a": [#node("a", 0)],
              "c": [#node("c", "-1")],
              "d": [#node("d", 0)]
            )
          )

There is likely a prettier way to this with cetz instead of diagraph.
#pagebreak()
== Tries
To draw tries we will once again make use of the #link("https://typst.app/universe/package/diagraph/")[*diagraph*] package.
```typst
#raw-render(

//    replace this comment with 3 backticks -> `
    digraph G{
    // decide shapes for nodes
      A [shape=circle]
      B [shape=circle]
      C [shape=circle]
      D [shape=rectangle]
      E [shape=rectangle]
      F [shape=rectangle]
      G [shape=rectangle]
      H [shape=rectangle]
      // add labels and or styls to edges
      A -> B [label="0"]
      A -> H [label="1"]
      B -> G [label="0"]
      B -> C [label="1"]
      C -> D [label="\$"]
      C -> E [label="0"]
      C -> F [label="1"]
      A -> G [style=dashed]
      B -> G [style=dashed]
      C -> E [style=dashed]
    }
//    replace this comment with 3 backticks -> `
    ,
    // label the nodes
    labels: (
      A: [1],
      B: [2],
      C: [3],
      D: [001\$],
      E: [0010\$],
      F: [0011\$],
      G: [00001\$],
      H: [011\$]
    )
  )
```
Which creates the following trie:
#raw-render(
    ```
      digraph G{
        A [shape=circle]
        B [shape=circle]
        C [shape=circle]
        D [shape=rectangle]
        E [shape=rectangle]
        F [shape=rectangle]
        G [shape=rectangle]
        H [shape=rectangle]
        A -> B [label="0"]
        A -> H [label="1"]
        B -> G [label="0"]
        B -> C [label="1"]
        C -> D [label="\$"]
        C -> E [label="0"]
        C -> F [label="1"]
        A -> G [style=dashed]
        B -> G [style=dashed]
        C -> E [style=dashed]
      }
    ```,
    labels: (
      A: [1],
      B: [2],
      C: [3],
      D: [001\$],
      E: [0010\$],
      F: [0011\$],
      G: [00001\$],
      H: [011\$]
    )
  )
There is likely a prettier way to this with cetz instead of diagraph.
#pagebreak()
== Quadtree
Consider the following grid:
#canvas({
  import draw: *
  rect((0, 0), (4, 4))
  line((2, 0), (2, 4))
  line((0, 2), (4, 2))
  line((0, 1), (2, 1))
  line((1, 0), (1, 2))
  circle((0.5, 0.5),  name: "a", radius: 2pt)
  circle((0.75, 1.3),  name: "b", radius: 2pt)
  circle((3.7, 2.6),  name: "c", radius: 2pt)
  content("a", $a$, anchor: "south-east", padding: .1)
  content("b", $b$, anchor: "south-east", padding: .1)
  content("c", $c$, anchor: "south-east", padding: .1)
})
If we wished to draw a quadtree for the points in the grid, we would make use of the #link("https://typst.app/universe/package/cetz/")[*cetz*] package like so:
```typst
#import "@preview/cetz:0.2.2": *
#canvas({
  import draw: *
    set-style(content: (padding: .1))
    tree.tree(([\[0, 4\), \[0, 4\)], // this is the root node
      ([$c$]),
      ([$nothing$]),
      ([\[0, 2\), \[0, 2\)],
        [$nothing$],
        [$b$],
        [$a$],
        [$nothing$],),
      ([$nothing$]),
    ),
      spread: .75, // spread controls how wide each child spreads from its parent
      grow: 2) // grow controls how far each child is from its parent
    })
})
```
Which outputs the following tree:
#canvas({
  import draw: *
    set-style(content: (padding: .1))
    tree.tree(([\[0, 4\), \[0, 4\)],
      ([$c$]),
      ([$nothing$]),
      ([\[0, 2\), \[0, 2\)],
        [$nothing$],
        [$b$],
        [$a$],
        [$nothing$],),
      ([$nothing$]),
    ),
      spread: .75,
      grow: 2)
})
