library(progressr)

message("progressor() ...")

message("- basic")
local({
  p <- progressor(3L)
  print(p)
  p()
  p("A message")
})

message("- default message")
local({
  p <- progressor(along = 1:3, message = "A default message")
  print(p)
  p()
  p("A message")
})

message("- zero length")
local({
  p <- progressor(0L)
  print(p)
  p()
  p("A message")
})

message("- multiple consequtive progressors")
local({
  message("Progressor #1")
  p <- progressor(2L)
  for (kk in 1:2) p()

  message("Progressor #2")
  p <- progressor(3L)
  for (kk in 1:3) p()

  message("Done")
})

message("- error: progressor() in the global environment")
res <- tryCatch(progressor(1L, envir = globalenv()), error = identity)
stopifnot(inherits(res, "error"))

message("- error: progressor() in the global environment with on_exit = TRUE")
progressr_in_globalenv <- progressr:::progressr_in_globalenv
progressr_in_globalenv("allow")
res <- tryCatch(progressor(1L, envir = globalenv(), on_exit = TRUE), error = identity)
progressr_in_globalenv("disallow")
stopifnot(inherits(res, "error"))

message("- length.progressor()")
local({
  p <- progressor(5L)
  stopifnot(identical(length(p), 5L))
})

message("- finalize = TRUE")
local({
  p <- local({
    progressor(1L, finalize = TRUE)
  })
  p(amount = 0)
  rm(p)
  for (kk in 1:3) gc(verbose = FALSE)
})

message("progressor() ... DONE")

