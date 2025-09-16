<!--
%\VignetteIndexEntry{progressr: Render 'knitr' Documents}
%\VignetteAuthor{Henrik Bengtsson}
%\VignetteKeyword{R}
%\VignetteKeyword{package}
%\VignetteKeyword{vignette}
%\VignetteKeyword{knitr}
%\VignetteEngine{progressr::selfonly}
-->

When compiling ("knitting") an knitr-based vignette, for instance, via
`knitr::knit()`, **[knitr]** shows the progress of code chunks
processed thus far using a progress bar.  We can use **[progressr]**
also for this type of progress reporting.  To have **knitr** report on
progress via **progressr**, set R option `knitr.progress.fun` as:

```r
options(knitr.progress.fun = function(total, labels) {
  p <- progressr::progressor(total, on_exit = FALSE)
  list(
    update = function(i) p(sprintf("chunk: %s", labels[i])),
    done = function() p(type = "finish")
  )
})
```

That's it! With the above `knitr.progress.fun` option set, try to knit
a document, e.g.

```r
progressr::handlers(global = TRUE)
infile <- system.file("examples", "knitr-minimal.Rnw", package = "knitr")
outfile <- knitr::knit(infile)
```

To customize the progress bar, try for instance:

```r
progressr::handlers(global = TRUE)
options(crayon.enabled = TRUE)  ## force use of colors
progressr::handlers("pbcol")
```

This will produce a colored progress bar in the terminal.

_Comment:_ If the above knit example completes too quickly for you to
see the progress updates, you can add the "slowdown" handler to slow
down the knitting process, e.g.

```r
progressr::handlers(c("pbcol", "slowdown"))
```

This will add the overall process to take at least ten seconds
(default).


To make **knitr** report via **progressr** in all your R session, set
the above R option in your <code>~/.Rprofile</code> startup file, e.g.

```r
if (requireNamespace("progressr", quietly = TRUE)) {
  options(knitr.progress.fun = function(total, labels) {
    p <- progressr::progressor(total, on_exit = FALSE)
    list(
      update = function(i) p(sprintf("chunk: %s", labels[i])),
      done = function() p(type = "finish")
    )
  })
}
```


[progressr]: https://progressr.futureverse.org
[knitr]: https://cran.r-project.org/package=knitr
