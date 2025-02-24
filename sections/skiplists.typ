= Skiplists

The following is a function to automatically draw skip lists from an array of values using the #link("https://typst.app/universe/package/cetz/")[*cetz*] package:

```typst
#import "@preview/cetz:0.3.2": *
#let skiplist(values) = {
  canvas({
      import draw: *
      let h = values.map(val => val.last()).sorted().last() + 1
      let l = values.len() + 1
      // Create sentries
      for i in range(0, h - 1) {
        rect((0, 2 * i), (rel: (1, 1)))
        content((0.5, 2*i + 0.5), [$- infinity$])
        line((0.5, 2 * i + 1), (0.5, 2 * (i + 1)))
        rect((2 * l, 2 * i), (rel: (1, 1)))
        content((2 * l + 0.5, 2*i + 0.5), [$infinity$])
        line((2 * l + 0.5, 2 * i + 1), (2 * l + 0.5, 2 * (i + 1)))
      }
      // Add top level
      rect((0, 2 * (h - 1)), (rel: (1, 1)))
      content((0.5, 2*(h - 1) + 0.5), [$- infinity$])
      rect((2 * l, 2 * (h - 1)), (rel: (1, 1)))
      content((2 * l + 0.5, 2*(h - 1) + 0.5), [$infinity$])
      // Add remaining nodes
      for (index, (val, height)) in values.enumerate(){
        for i in range(1, h){
          if i < height {
            rect((2 * (index + 1), 2 * i), (rel:(1, 1)))
            content((2 * (index + 1) + 0.5, 2 * i + 0.5), [#val])
            line((2 * (index + 1) + 0.5, 2 * i - 1), (2 * (index + 1) + 0.5, 2 * i))
          } else {
            line((2 * (index + 1), 2 * i + 0.5), (rel: (1, 0)))
          }
        }
        rect((2 * (index + 1), 0), (rel: (1, 1)))
        content((2 * (index + 1) + 0.5, 0.5), [#val])
      }
      for i in range(0, l){
        for j in range(0, h){
          line((2 * i + 1, 2 * j + 0.5), (rel: (1, 0)))
        }
      }
    })
}
// this is all you have to change
// every entry in the array is of the form (value, height)
#let values = ((28, 1), (49, 5), (60, 3), (64, 2), (66, 3), (67, 3), (81, 1))
#skiplist(values)
```

The output from the code will look like this:

#import "@preview/cetz:0.3.2": *
#let skiplist(values) = {
  canvas({
      import draw: *
      let h = values.map(val => val.last()).sorted().last() + 1
      let l = values.len() + 1
      // Create sentries
      for i in range(0, h - 1) {
        rect((0, 2 * i), (rel: (1, 1)))
        content((0.5, 2*i + 0.5), [$- infinity$])
        line((0.5, 2 * i + 1), (0.5, 2 * (i + 1)))
        rect((2 * l, 2 * i), (rel: (1, 1)))
        content((2 * l + 0.5, 2*i + 0.5), [$infinity$])
        line((2 * l + 0.5, 2 * i + 1), (2 * l + 0.5, 2 * (i + 1)))
      }
      // Add top level
      rect((0, 2 * (h - 1)), (rel: (1, 1)))
      content((0.5, 2*(h - 1) + 0.5), [$- infinity$])
      rect((2 * l, 2 * (h - 1)), (rel: (1, 1)))
      content((2 * l + 0.5, 2*(h - 1) + 0.5), [$infinity$])
      // Add remaining nodes
      for (index, (val, height)) in values.enumerate(){
        for i in range(1, h){
          if i < height {
            rect((2 * (index + 1), 2 * i), (rel:(1, 1)))
            content((2 * (index + 1) + 0.5, 2 * i + 0.5), [#val])
            line((2 * (index + 1) + 0.5, 2 * i - 1), (2 * (index + 1) + 0.5, 2 * i))
          } else {
            line((2 * (index + 1), 2 * i + 0.5), (rel: (1, 0)))
          }
        }
        rect((2 * (index + 1), 0), (rel: (1, 1)))
        content((2 * (index + 1) + 0.5, 0.5), [#val])
      }
      for i in range(0, l){
        for j in range(0, h){
          line((2 * i + 1, 2 * j + 0.5), (rel: (1, 0)))
        }
      }
    })
}
#let values = ((28, 1), (49, 5), (60, 3), (64, 2), (66, 3), (67, 3), (81, 1))
#skiplist(values)
