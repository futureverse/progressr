library(progressr)

options(progressr.clear = FALSE)

message("handler_callback() ...")

# 1. Create
h_default <- handler_callback()
stopifnot(inherits(h_default, "callback_progression_handler"))
print(h_default)

h_default(progression(type = "initiate", steps = 10L, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
h_default(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
h_default(progression(type = "finish", progressor_uuid = "uuid-1", progression_index = 3L))


# 2. The callback handler; record all calls to it
calls <- list()
record <- function(type, step, max_steps, message, amount, ...) {
  calls[[length(calls) + 1L]] <<- list(type = type, step = step,
                                        max_steps = max_steps,
                                        message = message, amount = amount)
}

## interval = 0 is required
h <- handler_callback(fcn = record, enable = TRUE, interval = 0)
stopifnot(inherits(h, "callback_progression_handler"))

h(progression(type = "initiate", steps = 10L, auto_finish = TRUE, progressor_uuid = "uuid-2", progression_index = 1L))
h(progression(type = "update", amount = 10, message = "Importing", progressor_uuid = "uuid-2", progression_index = 2L))
h(progression(type = "finish", progressor_uuid = "uuid-2", progression_index = 3L))

stopifnot(length(calls) == 3L)
stopifnot(calls[[1L]]$type == "initiate", calls[[1L]]$step == 0L, calls[[1L]]$max_steps == 10L)
stopifnot(calls[[2L]]$type == "update", calls[[2L]]$step == 10L, calls[[2L]]$amount == 10L, calls[[2L]]$message == "Importing")
stopifnot(calls[[3L]]$type == "finish", calls[[3L]]$step == 10L)


# 3. Argument 'fcn' must be a function
res <- tryCatch({
  handler_callback(fcn = "not a function")
}, error = identity)
stopifnot(inherits(res, "error"))


# 4. Run inside with_progress()
calls <- list()
message("with_progress(..., handlers = handler_callback(fcn = record))")
with_progress({
  p <- progressor(along = 1:5)
  for (i in 1:5) {
    Sys.sleep(getOption("progressr.demo.delay", 0.1))
    p(message = sprintf("Task %d", i))
  }
}, handlers = handler_callback(fcn = record, enable = TRUE, interval = 0))
stopifnot(length(calls) > 0L)
stopifnot(any(vapply(calls, FUN = function(x) x$type == "finish", FUN.VALUE = FALSE)))

message("handler_callback() ... done")
