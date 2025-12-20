# Use Progressr with Plyr Map-Reduce Functions

A "progress bar" for plyr's `.progress` argument.

## Usage

``` r
progress_progressr(...)
```

## Arguments

- ...:

  Not used.

## Value

A named [base::list](https://rdrr.io/r/base/list.html) that can be
passed as argument `.progress` to any of plyr function accepting that
argument.

## Limitations

One can use use
[`doFuture::registerDoFuture()`](https://doFuture.futureverse.org/reference/registerDoFuture.html)
to run plyr functions in parallel, e.g.
`plyr::l_ply(..., .parallel = TRUE)`. Unfortunately, using
`.parallel = TRUE` disables progress updates because, internally, plyr
forces `.progress = "none"` whenever `.parallel = TRUE`. Thus, despite
the future ecosystem and progressr would support it, it is not possible
to run dplyr in parallel *and* get progress updates at the same time.

## Examples

``` r
if (requireNamespace("plyr", quietly=TRUE)) {

  with_progress({
    y <- plyr::llply(1:10, function(x) {
      Sys.sleep(0.1)
      sqrt(x)
    }, .progress = "progressr")
  })
  
}
```
