# Report on Progress while Evaluating an R Expression

Report on Progress while Evaluating an R Expression

## Usage

``` r
with_progress(
  expr,
  handlers = progressr::handlers(),
  cleanup = TRUE,
  delay_terminal = NULL,
  delay_stdout = NULL,
  delay_conditions = NULL,
  interrupts = getOption("progressr.interrupts", TRUE),
  interval = NULL,
  enable = NULL
)

without_progress(expr)
```

## Arguments

- expr:

  An R expression to evaluate.

- handlers:

  A progression handler or a list of them. If NULL or an empty list,
  progress updates are ignored.

- cleanup:

  If TRUE, all progression handlers will be shutdown at the end
  regardless of whether the progression is complete or not.

- delay_terminal:

  If TRUE, output and conditions that may end up in the terminal will be
  delayed.

- delay_stdout:

  If TRUE, standard output is captured and relayed at the end just
  before any captured conditions are relayed.

- delay_conditions:

  A character vector specifying
  [base::condition](https://rdrr.io/r/base/conditions.html) classes to
  be captured and relayed at the end after any captured standard output
  is relayed.

- interrupts:

  Controls whether interrupts should be detected or not. If TRUE and an
  interrupt is signaled, progress handlers are asked to report on the
  current amount of progress when the evaluation was terminated by the
  interrupt, e.g. when a user pressed Ctrl-C in an interactive session,
  or a batch process was interrupted because it ran out of time. Note
  that it's optional for a progress handler to support this and only
  some do.

- interval:

  (numeric) The minimum time (in seconds) between successive progression
  updates from handlers.

- enable:

  (logical) If FALSE, then progress is not reported. The default is to
  report progress in interactive mode but not batch mode. See below for
  more details.

## Value

Returns the value of the expression.

## Details

If you are writing a Shiny app, use the
[`withProgressShiny()`](https://progressr.futureverse.org/reference/withProgressShiny.md)
function instead of this one.

If the global progression handler is enabled, it is temporarily disabled
while evaluating the `expr` expression.

If a `progression` condition causes the progressor to be completed
("reaches 100%"), then `with_progress()` will muffle the `progression`
condition preventing it from reaching, say, any global condition
handlers.

**IMPORTANT: This function is meant for end users only. It should not be
used by R packages, whose only task is to *signal* progress updates, not
to decide if, when, and how progress should be reported.**

`without_progress()` evaluates an expression while ignoring all progress
updates.

## Progression handler functions

Formally, progression handlers are calling handlers that are called when
a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition is signaled. These handlers are functions that take one
argument which is the
[progression](https://progressr.futureverse.org/reference/progression.md)
condition.

## Progress updates in batch mode

When running R from the command line, R runs in a non-interactive mode
([`interactive()`](https://rdrr.io/r/base/interactive.html) returns
`FALSE`). The default behavior of `with_progress()` is to *not* report
on progress in non-interactive mode. To have progress being reported
also then, set R options progressr.enable or environment variable
`R_PROGRESSR_ENABLE` to `TRUE`. Alternatively, one can set argument
`enable=TRUE` when calling `with_progress()`. For example,

    $ Rscript -e "library(progressr)" -e "with_progress(slow_sum(1:5))"

will *not* report on progress, whereas:

    $ export R_PROGRESSR_ENABLE=TRUE
    $ Rscript -e "library(progressr)" -e "with_progress(slow_sum(1:5))"

will.

## See also

For Shiny apps, use
[`withProgressShiny()`](https://progressr.futureverse.org/reference/withProgressShiny.md)
instead of this function. Internally, this function is built around
[`base::withCallingHandlers()`](https://rdrr.io/r/base/conditions.html).

## Examples

``` r
## The slow_sum() example function
slow_sum <- progressr::slow_sum
print(slow_sum)
#> function (x, delay = getOption("progressr.demo.delay", 1), stdout = FALSE, 
#>     message = TRUE, sticky = TRUE) 
#> {
#>     if (missing(stdout)) 
#>         stdout <- getOption("progressr.slow_sum.stdout", FALSE)
#>     if (missing(message)) 
#>         message <- getOption("progressr.slow_sum.message", TRUE)
#>     if (missing(sticky)) 
#>         sticky <- getOption("progressr.slow_sum.sticky", TRUE)
#>     p <- progressor(along = x)
#>     sum <- 0
#>     for (kk in seq_along(x)) {
#>         p(amount = 0)
#>         Sys.sleep(0.2 * delay)
#>         if (stdout) 
#>             cat(sprintf("O: Element #%d\n", kk))
#>         Sys.sleep(0.2 * delay)
#>         p(amount = 0)
#>         Sys.sleep(0.2 * delay)
#>         sum <- sum + x[kk]
#>         p(message = sprintf("P: Adding %g", kk))
#>         Sys.sleep(0.2 * delay)
#>         if (message) 
#>             message(sprintf("M: Added value %g", x[kk]))
#>         p(amount = 0)
#>         Sys.sleep(0.2 * delay)
#>         if (sticky && kk%%10 == 0) {
#>             p(amount = 0, message = sprintf("P: %d elements done", 
#>                 kk), class = "sticky")
#>         }
#>     }
#>     p(amount = 0)
#>     sum
#> }
#> <bytecode: 0x5d945411d368>
#> <environment: namespace:progressr>

x <- 1:10

## Without progress updates
y <- slow_sum(x)
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


## Progress reported via txtProgressBar (default)
handlers("txtprogressbar")  ## default
with_progress({
  y <- slow_sum(x)
})
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

## Progress reported via tcltk::tkProgressBar
if (capabilities("tcltk") && requireNamespace("tcltk", quietly = TRUE)) {
  handlers("tkprogressbar")
  with_progress({
    y <- slow_sum(x)
  })
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

## Progress reported via progress::progress_bar)
if (requireNamespace("progress", quietly = TRUE)) {
  handlers("progress")
  with_progress({
    y <- slow_sum(x)
  })
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

## Progress reported via txtProgressBar and beepr::beep
if (requireNamespace("beepr", quietly = TRUE)) {
  handlers("beepr", "txtprogressbar")
  with_progress({
    y <- slow_sum(x)
  })
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

## Progress reported via customized utils::txtProgressBar and beepr::beep,
## if available.
handlers(handler_txtprogressbar(style = 3L))
if (requireNamespace("beepr", quietly = TRUE)) {
  handlers("beepr", append = TRUE)
}

with_progress({
  y <- slow_sum(1:30)
})
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
#> M: Added value 11
#> M: Added value 12
#> M: Added value 13
#> M: Added value 14
#> M: Added value 15
#> M: Added value 16
#> M: Added value 17
#> M: Added value 18
#> M: Added value 19
#> M: Added value 20
#> M: Added value 21
#> M: Added value 22
#> M: Added value 23
#> M: Added value 24
#> M: Added value 25
#> M: Added value 26
#> M: Added value 27
#> M: Added value 28
#> M: Added value 29
#> M: Added value 30
```
