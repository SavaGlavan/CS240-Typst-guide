= Trees
#import "@preview/cetz:0.3.1": *
#import "@preview/diagraph:0.3.0": *
#import "@preview/fletcher:0.5.2" as fletcher: *

== Binary tree
Using the #link("https://typst.app/universe/package/cetz/")[*cetz*] package we can draw binary trees:

```typst
#canvas({
  import draw: *

  let data = ([5], ([3], [1], [2]), ([7], [6]))
  tree.tree(
    data,
    draw-node: (node, ..) => {
      content((), text(black, [#node.content]))
    },
    draw-edge: (from, to, ..) => {
      let (a, b) = (from + ".center", to + ".center")
      line((a, .4, b), (b, .4, a))
    }
  )
})
```
#canvas({
  import draw: *

  let data = ([5], ([3], [1], [2]), ([7], [6]))
  tree.tree(
    data,
    draw-node: (node, ..) => {
      content((), text(black, [#node.content]))
    },
    draw-edge: (from, to, ..) => {
      let (a, b) = (from + ".center", to + ".center")
      line((a, .4, b), (b, .4, a))
    }
  )
})
Alternatively, and perhaps both easier and faster.
We can use the #link("https://typst.app/universe/package/fletcher/")[*Fletcher*] package to create a function that automatically draws binary trees from an array like so:
```typst
#let binary_tree(values) = {
  diagram(
  // Draw the nodes
    for i in range(0, int(calc.log(values.len(), base: 2)) + 1){
      for j in range(calc.min(values.len() - 1, calc.pow(2, i) - 1), calc.min(values.len(), calc.pow(2, i + 1) - 1)){
        node(((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (1 + 2 * (j + 1 - calc.pow(2, i))), i),
          str(values.at(j)),
          name: str(values.at(j)))
      }
    },
  // Draw the edges
    for i in range(1, int(calc.log(values.len(), base: 2)) + 1){
      for j in range(calc.min(values.len() - 1, calc.pow(2, i) - 1), calc.min(values.len(), calc.pow(2, i + 1) - 1)){
        edge(((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (1 + 2 * (j + 1 - calc.pow(2, i))), i),
          ((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (2 * (calc.rem(j, 2) + j + 1 - calc.pow(2, i))), i - 1))
      }
    }
  )
}

// This is all you need to modify, it is a binary tree as it would be stored in an array
#let my_tree = (5, 3, 7, 1, 2, 6)

#binary_tree(my_tree)
```
This produces the following tree:\
#let binary_tree(values) = {
  diagram(
    for i in range(0, int(calc.log(values.len(), base: 2)) + 1){
      for j in range(calc.min(values.len() - 1, calc.pow(2, i) - 1), calc.min(values.len(), calc.pow(2, i + 1) - 1)){
        node(((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (1 + 2 * (j + 1 - calc.pow(2, i))), i),
          str(values.at(j)),
          name: str(values.at(j)))
      }
    },
    for i in range(1, int(calc.log(values.len(), base: 2)) + 1){
      for j in range(calc.min(values.len() - 1, calc.pow(2, i) - 1), calc.min(values.len(), calc.pow(2, i + 1) - 1)){
        edge(((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (1 + 2 * (j + 1 - calc.pow(2, i))), i),
          ((calc.pow(2, calc.floor(calc.log(values.len(), base: 2)))/calc.pow(2, i + 1)) * (2 * (calc.rem(j, 2) + j + 1 - calc.pow(2, i))), i - 1))
      }
    }
  )
}
#let my_tree = (5, 3, 7, 1, 2, 6)
#binary_tree(my_tree)
#pagebreak()
== AVL tree
We can use the #link("https://typst.app/universe/package/diagraph/")[*diagraph*] package to draw AVL trees:
```typst
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

There is likely a prettier way to this with cetz or fletcher instead of diagraph.
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
There is likely a prettier way to this with cetz or fletcher instead of diagraph.
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
#canvas({
  import draw: *

  let data = ([\[0, 4\), \[0, 4\)],
                ([c]),
                ([$nothing$]),
                ([\[0, 2\), \[0, 2\)],
                  [$nothing$],
                  [b],
                  [a],
                  [$nothing$]),
                ([$nothing$]),)
  tree.tree(
    data,
    draw-node: (node, ..) => {
      content((), text(black, [#node.content]))
    },
    draw-edge: (from, to, ..) => {
      let (a, b) = (from + ".center", to + ".center")
      line((a, .4, b), (b, .4, a))
    },
    spread: .75, //controls how far apart nodes spread from each other
    grow: 2 // controls how for down nodes spread from each other
  )
})

```
Which outputs the following tree:
#canvas({
  import draw: *

  let data = ([\[0, 4\), \[0, 4\)],
                ([c]),
                ([$nothing$]),
                ([\[0, 2\), \[0, 2\)],
                  [$nothing$],
                  [b],
                  [a],
                  [$nothing$]),
                ([$nothing$]),)
  tree.tree(
    data,
    draw-node: (node, ..) => {
      content((), text(black, [#node.content]))
    },
    draw-edge: (from, to, ..) => {
      let (a, b) = (from + ".center", to + ".center")
      line((a, .4, b), (b, .4, a))
    },
    spread: .75,
    grow: 2
  )
})
