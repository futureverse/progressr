# Progression Handler: Progress Reported via 'cli' Progress Bars (Text) in the Terminal

A progression handler for
[`cli::cli_progress_bar()`](https://cli.r-lib.org/reference/cli_progress_bar.html).

## Usage

``` r
handler_cli(
  show_after = 0,
  intrusiveness = getOption("progressr.intrusiveness.terminal", 1),
  target = "terminal",
  ...
)
```

## Arguments

- show_after:

  (numeric) Number of seconds to wait before displaying the progress
  bar.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`cli::cli_progress_bar()`](https://cli.r-lib.org/reference/cli_progress_bar.html)
  and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the cli package.

## Appearance

Below are a few examples on how to use and customize this progress
handler. In all cases, we use `handlers(global = TRUE)`.

    handlers("cli")
    y <- slow_sum(1:25)

![](figures/handler_cli-default.svg)

    handlers(handler_cli(format = "{cli::pb_spin} {cli::pb_bar} {cli::pb_current}/{cli::pb_total} {cli::pb_status}"))
    y <- slow_sum(1:25)

![](figures/handler_cli-format-1.svg)

## Examples

``` r
if (requireNamespace("cli", quietly = TRUE)) {
  handlers(handler_cli(format = "{cli::pb_spin} {cli::pb_bar} {cli::pb_percent} {cli::pb_status}"))
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
