# Control How Progress is Reported

Control How Progress is Reported

## Usage

``` r
handlers(
  ...,
  append = FALSE,
  on_missing = c("error", "warning", "ignore"),
  default = handler_txtprogressbar,
  global = NULL
)
```

## Arguments

- append:

  (logical) If FALSE, the specified progression handlers replace the
  current ones, otherwise appended to them.

- on_missing:

  (character) If `"error"`, an error is thrown if one of the progression
  handlers does not exists. If `"warning"`, a warning is produces and
  the missing handlers is ignored. If `"ignore"`, the missing handlers
  is ignored.

- default:

  The default progression calling handler to use if none are set.

- global:

  If TRUE, then the global progression handler is enabled. If FALSE, it
  is disabled. If NA, then TRUE is returned if it is enabled, otherwise
  FALSE. Argument `global` must not used with other arguments.

- ...:

  One or more progression handlers. Alternatively, this functions
  accepts also a single vector of progression handlers as input. If this
  vector is empty, then an empty set of progression handlers will be
  set.

## Value

(invisibly) the previous list of progression handlers set. If no
arguments are specified, then the current set of progression handlers is
returned. If `global` is specified, then TRUE is returned if the global
progression handlers is enabled, otherwise false.

## Details

This function provides a convenient alternative for getting and setting
option progressr.handlers.

## For package developers

**IMPORTANT: Setting progression handlers is a privilege that should be
left to the end user. It should not be used by R packages, which only
task is to *signal* progress updates, not to decide if, when, and how
progress should be reported.**

If you have to set or modify the progression handlers inside a function,
please make sure to undo the settings afterward. If not, you will break
whatever progression settings the user already has for other purposes
used elsewhere. To undo you settings, you can do:

    old_handlers <- handlers(c("beepr", "progress"))
    on.exit(handlers(old_handlers), add = TRUE)

## Configuring progression handling during R startup

A convenient place to configure the default progression handler and to
enable global progression reporting by default is in the `~/.Rprofile`
startup file. For example, the following will (i) cause your interactive
R session to use global progression handler by default, and (ii) report
progress via the progress package when in the terminal and via the
RStudio Jobs progress bar when in the RStudio Console.
[handler_txtprogressbar](https://progressr.futureverse.org/reference/handler_txtprogressbar.md),
other whenever using the RStudio Console, add the following to your
`~/.Rprofile` startup file:

    if (interactive() && requireNamespace("progressr", quietly = TRUE)) {
      ## Enable global progression updates
      if (getRversion() >= 4) progressr::handlers(global = TRUE)

      ## In RStudio Console, or not?
      if (Sys.getenv("RSTUDIO") == "1" && !nzchar(Sys.getenv("RSTUDIO_TERM"))) {
        options(progressr.handlers = progressr::handler_rstudio)
      } else {
        options(progressr.handlers = progressr::handler_progress)
      }
    }

## Examples
