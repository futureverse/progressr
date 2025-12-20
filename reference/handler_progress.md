# Progression Handler: Progress Reported via 'progress' Progress Bars (Text) in the Terminal

A progression handler for
[`progress::progress_bar()`](http://r-lib.github.io/progress/reference/progress_bar.md).

## Usage

``` r
handler_progress(
  format = ":spin [:bar] :percent :message",
  show_after = 0,
  intrusiveness = getOption("progressr.intrusiveness.terminal", 1),
  target = "terminal",
  ...
)
```

## Arguments

- format:

  (character string) The format of the progress bar.

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
  [`progress::progress_bar()`](http://r-lib.github.io/progress/reference/progress_bar.md)
  and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the progress package.

## Appearance

Below are a few examples on how to use and customize this progress
handler. In all cases, we use `handlers(global = TRUE)`.

    handlers("progress")
    y <- slow_sum(1:25)

![](figures/handler_progress-default.svg)

    handlers(handler_progress(complete = "#"))
    y <- slow_sum(1:25)

![](figures/handler_progress-complete.svg)

    handlers(handler_progress(format = ":spin [:bar] :percent :message"))
    y <- slow_sum(1:25)

![](figures/handler_progress-format-1.svg)

    handlers(handler_progress(format = ":percent [:bar] :eta :message"))
    y <- slow_sum(1:25)

![](figures/handler_progress-format-2.svg)

## Examples

``` r
if (requireNamespace("progress", quietly = TRUE)) {

  handlers(handler_progress(format = ":spin [:bar] :percent :message"))
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
