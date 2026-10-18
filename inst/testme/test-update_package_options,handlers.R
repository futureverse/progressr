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


message("get_package_option() ...")

get_package_option <- progressr:::get_package_option
stopifnot(is.null(get_package_option("no_such_option")))
options(progressr.no_such_option = "value")
stopifnot(identical(get_package_option("no_such_option"), "value"))
stopifnot(identical(get_package_option("progressr.no_such_option", package = NULL), "value"))
options(progressr.no_such_option = NULL)

message("get_package_option() ... done")


message("update_package_option() - debug messages, defaults, and coercion ...")

Sys.setenv(R_PROGRESSR_MY_NUMERIC_OPT = "3.14")
options(progressr.my_numeric_opt = NULL)
res <- update_package_option("my_numeric_opt", mode = "numeric", debug = TRUE)
stopifnot(identical(res, 3.14))
Sys.unsetenv("R_PROGRESSR_MY_NUMERIC_OPT")
options(progressr.my_numeric_opt = NULL)

## Env var not set; a default is used (debug)
res <- update_package_option("my_defaulted_opt", mode = "numeric", default = 7, debug = TRUE)
stopifnot(identical(res, 7))
options(progressr.my_defaulted_opt = NULL)

## Env var not set; no default => nothing to do
res <- update_package_option("my_unset_opt", mode = "numeric", debug = TRUE)
stopifnot(is.null(res))

message("update_package_option() - debug messages, defaults, and coercion ... done")


message("update_package_option() - trimmed value is empty ...")

Sys.setenv(R_PROGRESSR_MY_EMPTY_OPT = "   ")
options(progressr.my_empty_opt = NULL)
res <- update_package_option("my_empty_opt", mode = "character")
stopifnot(is.null(res))
Sys.unsetenv("R_PROGRESSR_MY_EMPTY_OPT")
options(progressr.my_empty_opt = NULL)

message("update_package_option() - trimmed value is empty ... done")


message("update_package_option() - split argument ...")

Sys.setenv(R_PROGRESSR_MY_SPLIT_OPT = " a , b , c ")
options(progressr.my_split_opt = NULL)
res <- update_package_option("my_split_opt", mode = "character", split = ",")
stopifnot(identical(res, c("a", "b", "c")))
Sys.unsetenv("R_PROGRESSR_MY_SPLIT_OPT")
options(progressr.my_split_opt = NULL)

message("update_package_option() - split argument ... done")


message("update_package_option() - disallowed values ...")

## disallow = "NA" (the default): coercion to the target mode produces NA
Sys.setenv(R_PROGRESSR_MY_NA_OPT = "not_a_number")
options(progressr.my_na_opt = NULL)
res <- tryCatch(update_package_option("my_na_opt", mode = "numeric"), error = identity)
stopifnot(inherits(res, "error"))
Sys.unsetenv("R_PROGRESSR_MY_NA_OPT")
options(progressr.my_na_opt = NULL)

## disallow = "non-positive"
Sys.setenv(R_PROGRESSR_MY_POS_OPT = "0")
options(progressr.my_pos_opt = NULL)
res <- tryCatch(update_package_option("my_pos_opt", mode = "numeric", disallow = "non-positive"), error = identity)
stopifnot(inherits(res, "error"))
Sys.unsetenv("R_PROGRESSR_MY_POS_OPT")
options(progressr.my_pos_opt = NULL)

## disallow = "negative"
Sys.setenv(R_PROGRESSR_MY_NEG_OPT = "-1")
options(progressr.my_neg_opt = NULL)
res <- tryCatch(update_package_option("my_neg_opt", mode = "numeric", disallow = "negative"), error = identity)
stopifnot(inherits(res, "error"))
Sys.unsetenv("R_PROGRESSR_MY_NEG_OPT")
options(progressr.my_neg_opt = NULL)

message("update_package_option() - disallowed values ... done")


message("update_package_option() - force = TRUE overrides an already-set option ...")

options(progressr.my_force_opt = 1)
Sys.setenv(R_PROGRESSR_MY_FORCE_OPT = "2")
res <- update_package_option("my_force_opt", mode = "numeric", force = TRUE, debug = TRUE)
stopifnot(identical(res, 2))
Sys.unsetenv("R_PROGRESSR_MY_FORCE_OPT")
options(progressr.my_force_opt = NULL)

message("update_package_option() - force = TRUE overrides an already-set option ... done")


message("update_package_options() ...")

update_package_options <- progressr:::update_package_options

old_opts <- options()
update_package_options(debug = FALSE)
options(old_opts)

## Special case: R_PROGRESSR_ENABLE = "interactive"
old_enable_env <- Sys.getenv("R_PROGRESSR_ENABLE", NA_character_)
old_enable_opt <- options(progressr.enable = NULL)
Sys.setenv(R_PROGRESSR_ENABLE = "interactive")
update_package_options()
stopifnot(identical(getOption("progressr.enable"), interactive()))
if (is.na(old_enable_env)) {
  Sys.unsetenv("R_PROGRESSR_ENABLE")
} else {
  Sys.setenv(R_PROGRESSR_ENABLE = old_enable_env)
}
options(old_enable_opt)

message("update_package_options() ... done")
