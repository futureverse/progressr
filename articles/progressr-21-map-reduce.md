# progressr: Map-Reduce Calls, e.g. lapply() and map()

Progress updates by **[progressr](https://progressr.futureverse.org)**
are designed to work out of the box for any iterator framework in R,
e.g. [`lapply()`](https://rdrr.io/r/base/lapply.html),
**[foreach](https://cran.r-project.org/package=foreach)**,
**[purrr](https://cran.r-project.org/package=purrr)**, and
**[plyr](https://cran.r-project.org/package=plyr)**. Below you will find
a set of examples that illustrate how to use **progressr** in common use
cases.

## Base R apply functions

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`progressr`](https://progressr.futureverse.org)`)`\
[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``global ``=`` ``TRUE``)`\
\
`my_fcn`` ``<-`` ``function``(``xs``)`` ``{`\
`  ``p`` ``<-`` `[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``along ``=`` ``xs``)`\
`  `[`lapply`](https://rdrr.io/r/base/lapply.html)`(``xs``, ``function``(``x``)`` ``{`\
`    `[`Sys.sleep`](https://rdrr.io/r/base/Sys.sleep.html)`(``0.1``)`\
`    `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"x=%g"``, ``x``)``)`\
`    `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x``)`\
`  ``}``)`\
`}`\
\
`y`` ``<-`` ``my_fcn``(``1``:``10``)`\
`#  |====================                               |  40%`

## The foreach package

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`foreach`](https://github.com/RevolutionAnalytics/foreach)`)`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`progressr`](https://progressr.futureverse.org)`)`\
[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``global ``=`` ``TRUE``)`\
\
`my_fcn`` ``<-`` ``function``(``xs``)`` ``{`\
`  ``p`` ``<-`` `[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``along ``=`` ``xs``)`\
`  `[`foreach`](https://rdrr.io/pkg/foreach/man/foreach.html)`(``x ``=`` ``xs``)`` `[`%do%`](https://rdrr.io/pkg/foreach/man/foreach.html)` ``{`\
`    `[`Sys.sleep`](https://rdrr.io/r/base/Sys.sleep.html)`(``0.1``)`\
`    `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"x=%g"``, ``x``)``)`\
`    `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x``)`\
`  ``}`\
`}`\
\
`y`` ``<-`` ``my_fcn``(``1``:``10``)`\
`#  |====================                               |  40%`

## The purrr package

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`purrr`](https://purrr.tidyverse.org/)`)`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`progressr`](https://progressr.futureverse.org)`)`\
[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``global ``=`` ``TRUE``)`\
\
`my_fcn`` ``<-`` ``function``(``xs``)`` ``{`\
`  ``p`` ``<-`` `[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``along ``=`` ``xs``)`\
`  `[`map`](https://purrr.tidyverse.org/reference/map.html)`(``xs``, ``function``(``x``)`` ``{`\
`    `[`Sys.sleep`](https://rdrr.io/r/base/Sys.sleep.html)`(``0.1``)`\
`    `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"x=%g"``, ``x``)``)`\
`    `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x``)`\
`  ``}``)`\
`}`\
\
`y`` ``<-`` ``my_fcn``(``1``:``10``)`\
`#  |====================                               |  40%`

## The plyr package

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`plyr`](http://had.co.nz/plyr)`)`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`progressr`](https://progressr.futureverse.org)`)`\
[`handlers`](https://progressr.futureverse.org/reference/handlers.md)`(``global ``=`` ``TRUE``)`\
\
`my_fcn`` ``<-`` ``function``(``xs``)`` ``{`\
`  ``p`` ``<-`` `[`progressor`](https://progressr.futureverse.org/reference/progressor.md)`(``along ``=`` ``xs``)`\
`  `[`llply`](https://rdrr.io/pkg/plyr/man/llply.html)`(``xs``, ``function``(``x``, ``...``)`` ``{`\
`    `[`Sys.sleep`](https://rdrr.io/r/base/Sys.sleep.html)`(``0.1``)`\
`    `[`p`](https://rstudio.github.io/htmltools/reference/builder.html)`(`[`sprintf`](https://rdrr.io/r/base/sprintf.html)`(``"x=%g"``, ``x``)``)`\
`    `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x``)`\
`  ``}``)`\
`}`\
\
`y`` ``<-`` ``my_fcn``(``1``:``10``)`\
`#  |====================                               |  40%`

Note how this solution does not make use of **plyr**’s `.progress`
argument, because the above solution is more powerful and more flexible,
e.g. we have more control over progress updates and their messages.
However, if you prefer the traditional **plyr** approach, you can use
`.progress = "progressr"`,
e.g. `y <- llply(..., .progress = "progressr")`.
