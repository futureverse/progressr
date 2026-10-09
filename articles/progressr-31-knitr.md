# progressr: Render 'knitr' Documents

When compiling (“knitting”) a knitr-based vignette, for instance, via
[`knitr::knit()`](https://rdrr.io/pkg/knitr/man/knit.html),
**[knitr](https://cran.r-project.org/package=knitr)** shows the progress
of code chunks processed thus far using a progress bar. We can use
**[progressr](https://progressr.futureverse.org)** also for this type of
progress reporting. To have **knitr** report on progress via
**progressr**, set R option `knitr.progress.fun` as:

\
[`options`](https://rdrr.io/r/base/options.html)`(``knitr.progress.fun ``=`` ``function``(``total``, ``labels``)`` ``{`\
`  ``p`` ``<-`` ``progressr``::`[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``total``, on_exit ``=`` ``FALSE``)`\
`  `[`list`](https://rdrr.io/r/base/list.html)`(`\
`    update ``=`` ``function``(``i``)`` `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"chunk: %s"``, ``labels``[``i``]``)``)``,`\
`    done ``=`` ``function``(``)`` `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(``type ``=`` ``"finish"``)`\
`  ``)`\
`}``)`

That’s it! With the above `knitr.progress.fun` option set, try to knit a
document, e.g.

\
`progressr``::`[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``global ``=`` ``TRUE``)`\
`infile`` ``<-`` `[`system.file`](https://rdrr.io/r/base/system.file.html)`(``"examples"``, ``"knitr-minimal.Rnw"``, package ``=`` ``"knitr"``)`\
`outfile`` ``<-`` ``knitr``::`[`knit`](https://rdrr.io/pkg/knitr/man/knit.html)`(``infile``)`

To customize the progress bar, try for instance:

\
[`options`](https://rdrr.io/r/base/options.html)`(``crayon.enabled ``=`` ``TRUE``)``  ``## force use of colors`\
`progressr``::`[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``"pbcol"``, global ``=`` ``TRUE``)`

This will produce a colored progress bar in the terminal.

*Comment:* If the above knit example completes too quickly for you to
see the progress updates, you can add the “slowdown” handler to slow
down the knitting process, e.g.

\
`progressr``::`[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(`[`c`](https://rdrr.io/r/base/c.html)`(``"pbcol"``, ``"slowdown"``)``)`

This will cause the overall process to take at least ten seconds
(default).

To make **knitr** report via **progressr** in all your R session, set
the above R option in your `~/.Rprofile` startup file, e.g.

\
`if`` ``(`[`requireNamespace`](https://rdrr.io/r/base/ns-load.html)`(``"progressr"``, quietly ``=`` ``TRUE``)``)`` ``{`\
`  `[`options`](https://rdrr.io/r/base/options.html)`(``knitr.progress.fun ``=`` ``function``(``total``, ``labels``)`` ``{`\
`    ``p`` ``<-`` ``progressr``::`[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``total``, on_exit ``=`` ``FALSE``)`\
`    `[`list`](https://rdrr.io/r/base/list.html)`(`\
`      update ``=`` ``function``(``i``)`` `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"chunk: %s"``, ``labels``[``i``]``)``)``,`\
`      done ``=`` ``function``(``)`` `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(``type ``=`` ``"finish"``)`\
`    ``)`\
`  ``}``)`\
`}`
