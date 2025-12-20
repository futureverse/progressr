# progressr: Customize How Progress is Reported

*Intended audience: end-users only*

## Terminal-based progress bars

The default is to present progress via
[`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html),
which is available on all R installations. It presents itself as an
ASCII-based horizontal progress bar in the R terminal. This is rendered
as:

![SVG animation of the default “txtprogressbar” progress
handler](imgs/handler_txtprogressbar-default.svg)

SVG animation of the default “txtprogressbar” progress handler

We can tweak this “txtprogressbar” handler to use red hearts for the
bar, e.g.

``` r
handlers(handler_txtprogressbar(char = cli::col_red(cli::symbol$heart)))
```

which results in:

![SVG animation of the “txtprogressbar” progress handler with red
hearts](imgs/handler_txtprogressbar-char-ansi.svg)

SVG animation of the “txtprogressbar” progress handler with red hearts

Another example is:

``` r
handlers(handler_pbcol(
      adjust = 1.0,
    complete = function(s) cli::bg_red(cli::col_black(s)),
  incomplete = function(s) cli::bg_cyan(cli::col_black(s))
))
```

which results in:

![SVG animation of the “pbcol” progress handler with text aligned to the
right](imgs/handler_pbcol-adjust-right-complete.svg)

SVG animation of the “pbcol” progress handler with text aligned to the
right

To change the default, to, say, `cli_progress_bar()` by the
**[cli](https://cran.r-project.org/package=cli)** package, set:

``` r
handlers("cli")
```

This progress handler will present itself as:

![SVG animation of the default “cli” progress
handler](imgs/handler_cli-default.svg)

SVG animation of the default “cli” progress handler

To instead use `progress_bar()` by the
**[progress](https://cran.r-project.org/package=progress)** package,
set:

``` r
handlers("progress")
```

This progress handler will present itself as:

![SVG animation of the default “progress” progress
handler](imgs/handler_progress-default.svg)

SVG animation of the default “progress” progress handler

## Auditory progress updates

Progress updates do not have to be presented visually. They can equally
well be communicated via audio. For example, using:

``` r
handlers("beepr")
```

will present itself as sounds played at the beginning, while
progressing, and at the end (using different
**[beepr](https://cran.r-project.org/package=beepr)** sounds). There
will be *no* output written to the terminal;

``` r
> y <- slow_sum(1:10)
> y
[1] 55
>
```

## Concurrent auditory and visual progress updates

It is possible to have multiple progress handlers presenting progress
updates at the same time. For example, to get both visual and auditory
updates, use:

``` r
handlers("txtprogressbar", "beepr")
```

## Silence all progress

To silence all progress updates, use:

``` r
handlers("void")
```

## Further configuration of progress handlers

Above we have seen examples where the
[`handlers()`](https://progressr.futureverse.org/reference/handlers.md)
takes one or more strings as input,
e.g. `handlers(c("progress", "beepr"))`. This is short for a more
flexible specification where we can pass a list of handler functions,
e.g.

``` r
handlers(list(
  handler_progress(),
  handler_beepr()
))
```

With this construct, we can make adjustments to the default behavior of
these progress handlers. For example, we can configure the `format`,
`width`, and `complete` arguments of `progress::progress_bar$new()`, and
tell **beepr** to use a different `finish` sound and generate sounds at
most every two seconds by setting:

``` r
handlers(list(
  handler_progress(
    format   = ":spin :current/:total (:message) [:bar] :percent in :elapsed ETA: :eta",
    width    = 60,
    complete = "+"
  ),
  handler_beepr(
    finish   = "wilhelm",
    interval = 2.0
  )
))
```

## Set a default progress handler for all your R sessions

To set the default progress handler, or handlers, in all your R
sessions, call `progressr::handlers(...)` in your `~/.Rprofile` startup
file. For example,

``` r
if (requireNamespace("progressr", quietly = TRUE)) {
  progressr::handlers(global = TRUE)
  if (requireNamespace("cli", quietly = TRUE)) {
    progressr::handlers("cli")
  }
}
```
