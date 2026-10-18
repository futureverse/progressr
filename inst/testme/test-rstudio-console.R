library(progressr)

message("*** rstudio-console ...")

message("*** patch_rstudio_console_evidence() on R (< 4.0.0) ...")

## On R (< 4.0.0), global_progression_handler.R defines a package-local
## 'globalCallingHandlers' function that errors.  Because R resolves
## unqualified calls via lexical scoping, this local binding shadows
## base::globalCallingHandlers() for *all* functions in the 'progressr'
## namespace, including patch_rstudio_console_evidence(), which must
## never trigger that error - not even on R (< 4.0.0).
##
## This reproduces the failure in:
## https://github.com/futureverse/progressr/issues/198
##
## Simulate this by calling a copy of patch_rstudio_console_evidence()
## whose enclosing environment masks 'getRversion' and
## 'globalCallingHandlers', without touching the real namespace.
f <- progressr:::patch_rstudio_console_evidence
stopifnot(is.function(f))

masked <- new.env(parent = environment(f))
masked[["getRversion"]] <- function() numeric_version("3.6.3")
masked[["globalCallingHandlers"]] <- function(...) {
  stop("register_global_progression_handler() requires R (>= 4.0.0)")
}
environment(f) <- masked

res <- f()
stopifnot(
  is.logical(res),
  identical(names(res), c("console", "version", "message", "warning")),
  !any(res)
)

message("*** patch_rstudio_console_evidence() on R (< 4.0.0) ... DONE")

message("*** rstudio-console ... DONE")
