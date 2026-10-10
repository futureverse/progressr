library(progressr)


message("Exceptions ...")

message("- with_progress()")

invalid <- progression(type = "unknown", session_uuid = "dummy", progressor_uuid = "dummy", progression_index = 0L)
print(invalid)
res <- tryCatch(with_progress({
  signalCondition(invalid)
}, handlers = handler_debug), error = identity)
str(res)
stopifnot(inherits(res, "error"))


message("- progress_aggregator()")

invalid <- progression(type = "unknown", session_uuid = "dummy", progressor_uuid = "dummy", progression_index = 0L)
print(invalid)
local({
  progress <- progress_aggregator(progressor(2L))
  res <- tryCatch(progress({
    signalCondition(invalid)
  }), error = identity)
  str(res)
  stopifnot(inherits(res, "error"))
})


message("- warn_about_too_many_progressions()")

warn_about_too_many_progressions <- progressr:::warn_about_too_many_progressions

## A zero-amount progression is always okay
p0 <- progression(type = "update", amount = 0, progressor_uuid = "dummy", progression_index = 1L)
res <- tryCatch(withCallingHandlers(
  warn_about_too_many_progressions(p0),
  warning = function(w) stop("Unexpected warning: ", conditionMessage(w))
), error = identity)
stopifnot(!inherits(res, "error"))

## A 'finish' progression is always okay
pf <- progression(type = "finish", amount = 1, progressor_uuid = "dummy", progression_index = 2L)
res <- tryCatch(withCallingHandlers(
  warn_about_too_many_progressions(pf),
  warning = function(w) stop("Unexpected warning: ", conditionMessage(w))
), error = identity)
stopifnot(!inherits(res, "error"))

## Otherwise, a warning is produced
pu <- progression(type = "update", amount = 1, message = "too many", progressor_uuid = "dummy", progression_index = 3L)
res <- tryCatch(warn_about_too_many_progressions(pu), warning = identity)
stopifnot(inherits(res, "warning"))

## ... unless signalled from within with_progress(), as seen by the global handler
res <- tryCatch(withCallingHandlers(
  with_progress({
    warn_about_too_many_progressions(pu, global = TRUE)
  }),
  warning = function(w) stop("Unexpected warning: ", conditionMessage(w))
), error = identity)
stopifnot(!inherits(res, "error"))

message("- warn_about_too_many_progressions() ... done")


message("Exceptions ... done")

