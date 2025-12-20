# Progression Handler: Progress Reported as a Tcl/Tk Progress Bars in the GUI

A progression handler for
[`tcltk::tkProgressBar()`](https://rdrr.io/r/tcltk/tkProgressBar.html).

## Usage

``` r
handler_tkprogressbar(
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "terminal",
  inputs = list(title = NULL, label = "message"),
  ...
)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- inputs:

  (named list) Specifies from what sources the MS Windows progress
  elements 'title' and 'label' should be updated. Valid sources are
  `"message"`, `"sticky_message"` and `"non_sticky_message"`, where
  `"message"` is short for `c("non_sticky_message", "sticky_message")`.
  For example,
  `inputs = list(title = "sticky_message", label = "message")` will
  update the 'title' component from sticky messages only, whereas the
  'label' component is updated using any message.

- ...:

  Additional arguments passed to
  [`tcltk::tkProgressBar()`](https://rdrr.io/r/tcltk/tkProgressBar.html)
  and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the tcltk package and that the current
R session supports Tcl/Tk (`capabilities("tcltk")`).

## Examples

``` r
if (capabilities("tcltk") && requireNamespace("tcltk", quietly = TRUE)) {

  handlers("tkprogressbar")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 4
#> M: Added value 5
#> M: Added value 6
#> M: Added value 7
#> M: Added value 8
#> M: Added value 9
#> M: Added value 10
#> [1] 55
```
