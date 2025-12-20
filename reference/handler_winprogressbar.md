# Progression Handler: Progress Reported as a MS Windows Progress Bars in the GUI

A progression handler for `winProgressBar()` in the utils package.

## Usage

``` r
handler_winprogressbar(
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "gui",
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

  Additional arguments passed to `tcltk::winProgressBar()` and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires MS Windows.

## Examples

``` r
if (FALSE) { # \dontrun{
handlers(handler_winprogressbar())
with_progress(y <- slow_sum(1:100))
} # }
```
