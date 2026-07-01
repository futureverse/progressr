library(progressr)

options(progressr.clear = FALSE)

message("handler_ntfy() ...")

# 1. Force ntfy handler to run in fake mode
old_fake_handlers <- getOption("progressr.tests.fake_handlers")
env <- environment(progressr:::is_fake)
env$cache <- list()
options(progressr.tests.fake_handlers = c(old_fake_handlers, "handler_ntfy"))

# 2. Create handler
h <- handler_ntfy()
stopifnot(inherits(h, "ntfy_progression_handler"))

# Initiate
h(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))

# Update
h(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))

# Update with amount = 0 (returns early)
h(progression(type = "update", amount = 0, progressor_uuid = "uuid-1", progression_index = 3L))

# Interrupt
h(progressr:::control_progression("interrupt", message = "Interrupted progression"))

# Shutdown
h(progressr:::control_progression("shutdown"))


# 3. Test when finished = TRUE in finish()
h_finish <- handler_ntfy()
h_finish(progression(type = "initiate", steps = 10, auto_finish = FALSE, progressor_uuid = "uuid-2", progression_index = 1L))
h_finish(progression(type = "update", amount = 1, progressor_uuid = "uuid-2", progression_index = 2L))
h_finish(progressr:::control_progression("shutdown"))
# Second shutdown to check finished == TRUE branch
h_finish(progressr:::control_progression("shutdown"))


# 4. Test times = 1L (returns early in initiate)
h_times1 <- handler_ntfy(times = 1L)
h_times1(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-3", progression_index = 1L))
h_times1(progressr:::control_progression("shutdown"))


# 5. Test times <= 2L (returns early in update)
h_times2 <- handler_ntfy(times = 2L)
h_times2(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-4", progression_index = 1L))
h_times2(progression(type = "update", amount = 1, progressor_uuid = "uuid-4", progression_index = 2L))
h_times2(progressr:::control_progression("shutdown"))


# 6. Test state$enabled is FALSE (returns early in initiate, update, finish)
h_enable <- handler_ntfy(enable_after = 100.0)
h_enable(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-5", progression_index = 1L))
h_enable(progression(type = "update", amount = 1, progressor_uuid = "uuid-5", progression_index = 2L))
h_enable(progressr:::control_progression("shutdown"))


# 7. Test state$delta <= 0 in finish() (should skip progress_notify)
h_delta <- handler_ntfy()
h_delta(progression(type = "initiate", steps = 10, auto_finish = FALSE, progressor_uuid = "uuid-6", progression_index = 1L))
h_delta(progression(type = "update", amount = 0, progressor_uuid = "uuid-6", progression_index = 2L))
h_delta(progressr:::control_progression("shutdown"))


# 8. Test standard with_progress flow
with_progress({
  p <- progressor(along = 1:2)
  for (i in 1:2) p()
}, handlers = handler_ntfy())


# Restore options
options(progressr.tests.fake_handlers = old_fake_handlers)
env$cache <- list()

message("handler_ntfy() ... done")
