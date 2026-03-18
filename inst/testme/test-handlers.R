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
}
message("handlers(..., global = TRUE) ... DONE")

message("handlers() ... DONE")

