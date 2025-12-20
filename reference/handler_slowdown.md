# Progression Handler: Slow Down Progress Reporting

Progression Handler: Slow Down Progress Reporting

## Usage

``` r
handler_slowdown(
  duration = 10,
  intrusiveness = 0,
  target = "void",
  enable = getOption("progressr.enable", TRUE),
  ...
)
```

## Arguments

- duration:

  (numeric) Added slowdown (in seconds) across all progress steps, e.g.
  if `duration = 10.0` and `steps = 100L`, then each step unit is
  delayed 0.1 seconds, totaling a ten-second slowdown.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- enable:

  (logical) If FALSE, then progress is not reported.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Details

This progression handler delays each progress step a certain number of
seconds. It does not render any output.

## Examples

``` r
if (FALSE) { # \dontrun{
handlers(handler_slowdown(duration = 30.0)) ## 30-second total slowdown
with_progress(y <- slow_sum(1:100))
print(y)
} # }
```
