# Progression Handler: Progress Reported as an ANSI Background Color in the Terminal

Progression Handler: Progress Reported as an ANSI Background Color in
the Terminal

## Usage

``` r
handler_pbcol(
  adjust = 0,
  pad = 1L,
  complete = function(s) cli::bg_blue(cli::col_white(s)),
  incomplete = function(s) cli::bg_cyan(cli::col_white(s)),
  intrusiveness = getOption("progressr.intrusiveness.terminal", 1),
  target = "terminal",
  ...
)
```

## Arguments

- adjust:

  (numeric) The adjustment of the progress update, where `adjust = 0`
  positions the message to the very left, and `adjust = 1` positions the
  message to the very right.

- pad:

  (integer) Amount of padding on each side of the message, where padding
  is done by spaces.

- complete, incomplete:

  (function) Functions that take "complete" and "incomplete" strings
  that comprise the progress bar as input and annotate them to reflect
  their two different parts. The default is to annotation them with two
  different background colors and the same foreground color using the
  cli package.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the cli package.

## Appearance

Below are a few examples on how to use and customize this progress
handler. In all cases, we use `handlers(global = TRUE)`.

    handlers("pbcol")
    y <- slow_sum(1:25)

![](figures/handler_pbcol-default.svg)

    handlers(handler_pbcol(adjust = 0.5))
    y <- slow_sum(1:25)

![](figures/handler_pbcol-adjust-mid.svg)

    handlers(handler_pbcol(
      adjust = 1,
      complete = function(s) cli::bg_red(cli::col_black(s)),
      incomplete = function(s) cli::bg_cyan(cli::col_black(s))
    ))
    y <- slow_sum(1:25)

![](figures/handler_pbcol-adjust-right-complete.svg)

## Examples

``` r
handlers(handler_pbcol)
with_progress({ y <- slow_sum(1:10) })
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
print(y)
#> [1] 55
```
