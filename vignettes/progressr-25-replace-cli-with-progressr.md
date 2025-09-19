<!--
%\VignetteIndexEntry{progressr: Replace 'cli' Progress Bars with 'progressr'}
%\VignetteAuthor{Henrik Bengtsson}
%\VignetteKeyword{R}
%\VignetteKeyword{package}
%\VignetteKeyword{cli}
%\VignetteKeyword{purrr}
%\VignetteEngine{progressr::selfonly}
-->

The **cli** package is used for progress reporting by several
packages, notably tidyverse packages. For instance, in **purrr**, you
can do:

```r
y <- purrr::map(1:100, \(x) Sys.sleep(0.1), .progress = TRUE)
```

to report on progress via the **cli** package as `map()` is iterating
over the elements.  Now, instead of using the default, built-in
**cli** progress bar, we can customize **cli** to report on progress
via **[progressr]** instead.  To do this, set R option
`cli.progress_handlers` as:

```r
options(cli.progress_handlers = "progressr")
```

With this option set, **cli** will now report on progress according to
your `progressr::handlers()` settings.  For example, with:

```r
progressr::handlers(c("beepr", "rstudio"))
```

will report on progress using **beepr** and the RStudio Console
progress panel.

To make **cli** report via **progressr** in all your R session, set
the above R option in your <code>~/.Rprofile</code> startup file, e.g.

```r
if (requireNamespace("progressr", quietly = TRUE)) {
  options(cli.progress_handlers = "progressr")
}
```


_Note:_ A **cli** progress bar can have a "name", which can be
specfied in **purrr** function via argument `.progress`,
e.g. `.progress = "processing"`.  This name is then displayed in front
of the progress bar.  However, because the **progressr** framework
does not have a concept of progress "name", they are silently ignored
when using `options(cli.progress_handlers = "progressr")`.


[progressr]: https://progressr.futureverse.org
[beepr]: https://cran.r-project.org/package=beepr
[cli]: https://cran.r-project.org/package=cli
[purrr]: https://cran.r-project.org/package=purrr
