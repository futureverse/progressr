# Progression Handler: Progress Reported via 'shiny' Widgets (GUI) in the HTML Browser

A progression handler for shiny and
[`shiny::withProgress()`](https://rdrr.io/pkg/shiny/man/withProgress.html).

## Usage

``` r
handler_shiny(
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "gui",
  inputs = list(message = NULL, detail = "message"),
  enable = getOption("progressr.enable", TRUE),
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

  (named list) Specifies from what sources the Shiny progress elements
  'message' and 'detail' should be updated. Valid sources are
  `"message"`, `"sticky_message"` and `"non_sticky_message"`, where
  `"message"` is short for `c("non_sticky_message", "sticky_message")`.
  For example,
  `inputs = list(message = "sticky_message", detail = "message")` will
  update the Shiny 'message' component from sticky messages only,
  whereas the 'detail' component is updated using any message.

- enable:

  (logical) If FALSE, then progress is not reported.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Details

For most Shiny application there is little need to use this Shiny
handler directly. Instead, it is sufficient to use
[`withProgressShiny()`](https://progressr.futureverse.org/reference/withProgressShiny.md).

## Requirements

This progression handler requires the shiny package.

## Examples

``` r
if (FALSE) { # \dontrun{
handlers(handler_shiny())
with_progress(y <- slow_sum(1:100))
} # }
```
