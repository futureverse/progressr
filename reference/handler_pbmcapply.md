# Progression Handler: Progress Reported via 'pbmcapply' Progress Bars (Text) in the Terminal

A progression handler for
[`pbmcapply::progressBar()`](https://rdrr.io/pkg/pbmcapply/man/progressBar.html).

## Usage

``` r
handler_pbmcapply(
  char = "=",
  substyle = 3L,
  style = "ETA",
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

- substyle:

  (integer) The progress-bar substyle according to
  [`pbmcapply::progressBar()`](https://rdrr.io/pkg/pbmcapply/man/progressBar.html).

- style:

  (character) The progress-bar style according to

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
  [`pbmcapply::progressBar()`](https://rdrr.io/pkg/pbmcapply/man/progressBar.html)
  and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the pbmcapply package.

## Appearance

Below are a few examples on how to use and customize this progress
handler. In all cases, we use `handlers(global = TRUE)`. Since
`style = "txt"` corresponds to using
[`handler_txtprogressbar()`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)
with `style = substyle`, the main usage of this handler is with
`style = "ETA"` (default) for which `substyle` is ignored.

    handlers("pbmcapply")
    y <- slow_sum(1:25)

![](figures/handler_pbmcapply-default.svg)

## Examples

``` r
if (requireNamespace("pbmcapply", quietly = TRUE)) {

  handlers("pbmcapply")
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
