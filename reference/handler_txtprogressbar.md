# Progression Handler: Progress Reported as Plain Progress Bars (Text) in the Terminal

A progression handler for
[`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html).

## Usage

``` r
handler_txtprogressbar(
  char = "=",
  style = 3L,
  file = stderr(),
  intrusiveness = getOption("progressr.intrusiveness.terminal", 1),
  target = "terminal",
  ...
)
```

## Arguments

- char:

  (character) The symbols to form the progress bar for
  [`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html).
  Contrary to
  [`txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html),
  this handler supports also ANSI-colored symbols.

- style:

  (integer) The progress-bar style according to
  [`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html).

- file:

  (connection) A
  [base::connection](https://rdrr.io/r/base/connections.html) to where
  output should be sent.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html)
  and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Appearance

Below are a few examples on how to use and customize this progress
handler. In all cases, we use `handlers(global = TRUE)`.

    handlers("txtprogressbar")
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-default.svg)

    handlers(handler_txtprogressbar(style = 1L))
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-style-1.svg)

    handlers(handler_txtprogressbar(style = 3L))
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-style-3.svg)

    handlers(handler_txtprogressbar(char = "#"))
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-char.svg)

    handlers(handler_txtprogressbar(char = "<>"))
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-char-width-2.svg)

    handlers(handler_txtprogressbar(char = cli::col_red(cli::symbol$heart)))
    y <- slow_sum(1:25)

![](figures/handler_txtprogressbar-char-ansi.svg)

## Examples

``` r
handlers("txtprogressbar")

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
