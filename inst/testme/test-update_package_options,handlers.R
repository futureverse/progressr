library(progressr)

message("Processing of R_PROGRESSR_HANDLERS ...")

update_package_option <- progressr:::update_package_option

old_handlers <- options(progressr.handlers = NULL)
old_env <- Sys.getenv("R_PROGRESSR_HANDLERS", NA_character_)


message("- R_PROGRESSR_HANDLERS unset ...")
Sys.unsetenv("R_PROGRESSR_HANDLERS")
options(progressr.handlers = NULL)
res <- update_package_option("handlers", mode = "character")
stopifnot(is.null(res))
stopifnot(is.null(getOption("progressr.handlers")))


message("- R_PROGRESSR_HANDLERS=\"cli,beepr\" is stored as-is, unresolved ...")
options(progressr.handlers = NULL)
Sys.setenv(R_PROGRESSR_HANDLERS = "cli,beepr")
res <- update_package_option("handlers", mode = "character")
stopifnot(identical(res, "cli,beepr"))
stopifnot(identical(getOption("progressr.handlers"), "cli,beepr"))

## handlers() parses, expands, and validates the R option
hs <- handlers()
stopifnot(is.list(hs), length(hs) == 2L,
          identical(hs[[1]], handler_cli), identical(hs[[2]], handler_beepr))


message("- R_PROGRESSR_HANDLERS is trimmed ...")
options(progressr.handlers = NULL)
Sys.setenv(R_PROGRESSR_HANDLERS = "   cli ")
res <- update_package_option("handlers", mode = "character")
stopifnot(identical(res, "cli"))


message("- R_PROGRESSR_HANDLERS does not override option 'progressr.handlers', if set ...")
marker <- function(...) NULL
options(progressr.handlers = list(marker))
Sys.setenv(R_PROGRESSR_HANDLERS = "cli")
res <- update_package_option("handlers", mode = "character")
stopifnot(is.list(res), length(res) == 1L, identical(res[[1]], marker))


## Undo
options(old_handlers)
if (is.na(old_env)) {
  Sys.unsetenv("R_PROGRESSR_HANDLERS")
} else {
  Sys.setenv(R_PROGRESSR_HANDLERS = old_env)
}

message("Processing of R_PROGRESSR_HANDLERS ... DONE")
