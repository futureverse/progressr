library(progressr)

message("handlers() ...")

hs <- handlers()
print(hs)

for (kk in seq_along(hs)) {
  h <- hs[[kk]]
  print(h)
  handler <- h()
  print(handler)
}


hs <- handlers("txtprogressbar")
print(hs)

for (kk in seq_along(hs)) {
  h <- hs[[kk]]
  print(h)
  handler <- h()
  print(handler)
}

hs <- handlers("handler_txtprogressbar")
print(hs)

message("handlers() - exceptions ...")

## Will as a side-effect set an empty list of handlers()
res <- handlers("non-existing-handler", on_missing = "ignore")
res <- handlers()
stopifnot(is.list(res), length(res) == 0L)

res <- tryCatch({
  handlers("non-existing-handler", on_missing = "warning")
}, warning = identity)
stopifnot(inherits(res, "warning"))

res <- tryCatch({
  handlers("non-existing-handler", on_missing = "error")
}, error = identity)
stopifnot(inherits(res, "error"))


message("handlers() - exceptions ... DONE")

message("handlers(..., global = TRUE) ...")
if (getRversion() >= "4.0.0") {
  old_global <- handlers(global = NA)
  on.exit(handlers(global = old_global), add = TRUE)
  
  handlers(global = FALSE)
  stopifnot(handlers(global = NA) == FALSE)
  
  handlers("txtprogressbar", global = TRUE)
  stopifnot(handlers(global = NA) == TRUE)
  
  handlers("txtprogressbar", global = FALSE)
  stopifnot(handlers(global = NA) == FALSE)

  handlers(global = TRUE)
  handlers("txtprogressbar", global = FALSE)
  stopifnot(handlers(global = NA) == FALSE)

  ## Comma-separated handler names combined with global = TRUE
  handlers("cli,txtprogressbar", global = TRUE)
  hs <- handlers()
  stopifnot(is.list(hs), length(hs) == 2L,
            identical(hs[[1]], handler_cli), identical(hs[[2]], handler_txtprogressbar))
  stopifnot(handlers(global = NA) == TRUE)
  handlers(global = FALSE)
}
message("handlers(..., global = TRUE) ... DONE")

message("handlers() - option value is an all-whitespace string ...")

old <- options(progressr.handlers = "   ")
res <- handlers()
stopifnot(is.list(res), length(res) == 0L)
options(old)

message("handlers() - option value is an all-whitespace string ... done")


message("handlers() - named arguments and comma-separated names ...")

handlers(first = "cli,beepr", second = handler_void)
res <- handlers()
stopifnot(is.list(res), length(res) == 3L)
stopifnot(identical(res[[1]], handler_cli))
stopifnot(identical(res[[2]], handler_beepr))
stopifnot(identical(res[[3]], handler_void))
stopifnot(identical(names(res), c("cli", "beepr", "second")))

message("handlers() - named arguments and comma-separated names ... done")


message("handlers() - handler with a FALSE validator is dropped ...")

dummy <- function(...) NULL
attr(dummy, "validator") <- function() FALSE
handlers(dummy, handler_void, on_missing = "ignore")
res <- handlers()
stopifnot(is.list(res), length(res) == 1L)
stopifnot(identical(res[[1]], handler_void))

message("handlers() - handler with a FALSE validator is dropped ... done")


message("handlers() - append = TRUE ...")

handlers(handler_void)
res <- handlers(handler_debug, append = TRUE)
stopifnot(is.list(res), length(res) == 1L, identical(res[[1]], handler_void))
res <- handlers()
stopifnot(is.list(res), length(res) == 2L,
          identical(res[[1]], handler_void), identical(res[[2]], handler_debug))

message("handlers() - append = TRUE ... done")


message("handlers() ... DONE")

