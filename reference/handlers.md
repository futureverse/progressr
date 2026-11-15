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
  current ones, otherwise they are appended to them.

- on_missing:

  (character) If `"error"`, an error is thrown if one of the progression
  handlers does not exist. If `"warning"`, a warning is produced and the
  missing handler is ignored. If `"ignore"`, the missing handler is
  ignored.

- default:

  The default progression calling handler to use if none are set.

- global:

  If TRUE, then the global progression handler is enabled. If FALSE, it
  is disabled. If NA, then TRUE is returned if it is enabled, otherwise
  FALSE. Enabling or disabling it requires that there are no condition
  handlers active, which is a limitation of R's
  [`base::globalCallingHandlers()`](https://rdrr.io/r/base/conditions.html).
  For example, it cannot be done via
  [`base::tryCatch()`](https://rdrr.io/r/base/conditions.html),
  [`base::withCallingHandlers()`](https://rdrr.io/r/base/conditions.html),
  or [`base::suppressMessages()`](https://rdrr.io/r/base/message.html),
  or from within a package's `.onLoad()` or `.onAttach()` function.
  Trying to do so results in an error.

- ...:

  One or more progression handlers, specified as functions, handler
  names (character strings), or a mix of such. Strings may hold
  comma-separated handler names.

## Value

(invisibly) the previous list of progression handlers set. If no
arguments are specified, then the current set of progression handlers is
returned. If `global` is specified, then TRUE is returned if the global
progression handler is enabled, otherwise FALSE. If both handlers and
`global` are specified, then the previous list of progression handlers
is returned.

## Details

This function provides a convenient alternative for getting and setting
option progressr.handlers.

## For package developers

**IMPORTANT: Setting progression handlers is a privilege that should be
left to the end user. It should not be used by R packages, whose only
task is to *signal* progress updates, not to decide if, when, and how
progress should be reported.**

If you have to set or modify the progression handlers inside a function,
please make sure to undo the settings afterward. If not, you will break
whatever progression settings the user already has for other purposes
used elsewhere. To undo your settings, you can do:

    old_handlers <- handlers(c("beepr", "progress"))
    on.exit(handlers(old_handlers), add = TRUE)

It is not possible for a package to enable global progression handling
when it is loaded or attached, i.e. by calling `handlers(global = TRUE)`
in `.onLoad()` or `.onAttach()`. This is because R always calls those
functions via [`tryCatch()`](https://rdrr.io/r/base/conditions.html),
and R does not allow global calling handlers to be registered when there
are condition handlers active. Instead, enabling global progression
handling is up to the end user, e.g. in their `~/.Rprofile` startup
file, as explained below.

## Configuring progression handling during R startup

A convenient place to configure the default progression handler and to
enable global progression reporting by default is in the `~/.Rprofile`
startup file. For example, the following will (i) cause your interactive
R session to use global progression handler by default, and (ii) report
progress via the progress package when in the terminal and via the
RStudio Jobs progress bar when in the RStudio Console. To configure
this, add the following to your `~/.Rprofile` startup file:

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
