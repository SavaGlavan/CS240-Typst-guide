= Pseudocode

For writing pseudocode, I recommend using the #link("https://typst.app/universe/package/algo/")[algo] package.
Here is a basic example of using algo from the package's documentation:
```typst
  #import "@preview/algo:0.3.4": *
  #algo(
    title: "Fib",
    parameters: ("n",)
  )[
    if $n < 0$:#i\        // use #i to indent the following lines
      return null#d\      // use #d to dedent the following lines
    if $n = 0$ or $n = 1$:#i #comment[you can also]\
      return $n$#d #comment[add comments!]\
    return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$
    ]
```

The output from the code will look like this:

#import "@preview/algo:0.3.4": *
#algo(
  title: "Fib",
  parameters: ("n",)
)[
  if $n < 0$:#i\        // use #i to indent the following lines
    return null#d\      // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i #comment[you can also]\
    return $n$#d #comment[add comments!]\
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$
  ]
