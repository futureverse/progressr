library(progressr)

options(progressr.clear = FALSE)

message("handler_slowdown() ...")

# 1. Check invalid inputs
assert_error <- function(expr) {
  res <- tryCatch(eval(expr), error = identity)
  stopifnot(inherits(res, "error"))
}

assert_error(handler_slowdown(duration = -1))
assert_error(handler_slowdown(duration = Inf))
assert_error(handler_slowdown(duration = NA_real_))
assert_error(handler_slowdown(duration = c(1, 2)))
assert_error(handler_slowdown(duration = "foo"))

# 2. Test manual progression calls when enable = FALSE
h_disabled <- handler_slowdown(enable = FALSE)
stopifnot(inherits(h_disabled, "slowdown_progression_handler"))
h_disabled(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
h_disabled(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
h_disabled(progression(type = "finish", progressor_uuid = "uuid-1", progression_index = 3L))

# 3. Test manual progression calls when enable = TRUE
h_enabled <- handler_slowdown(duration = 0.1, enable = TRUE)
stopifnot(inherits(h_enabled, "slowdown_progression_handler"))

# Initiate
h_enabled(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-2", progression_index = 1L))

# Update (state$enabled is TRUE)
h_enabled(progression(type = "update", amount = 1, progressor_uuid = "uuid-2", progression_index = 2L))

# Finish
h_enabled(progression(type = "finish", progressor_uuid = "uuid-2", progression_index = 3L))

# 4. Test when state$enabled is FALSE (returns early in update)
h_not_enabled <- handler_slowdown(duration = 0.1, enable_after = 100.0, enable = TRUE)
h_not_enabled(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-3", progression_index = 1L))
# Update (state$enabled is FALSE, returns early)
h_not_enabled(progression(type = "update", amount = 1, progressor_uuid = "uuid-3", progression_index = 2L))
h_not_enabled(progression(type = "finish", progressor_uuid = "uuid-3", progression_index = 3L))

# 5. Run with_progress
message("with_progress(..., handlers = handler_slowdown(duration = 0.05))")
with_progress({
  p <- progressor(along = 1:2)
  for (i in 1:2) {
    p()
  }
}, handlers = handler_slowdown(duration = 0.05))

message("handler_slowdown() ... done")
