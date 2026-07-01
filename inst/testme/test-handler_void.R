library(progressr)

options(progressr.clear = FALSE)

message("handler_void() ...")

# 1. Test creation and properties
h_disabled <- handler_void(enable = FALSE)
stopifnot(inherits(h_disabled, "void_progression_handler"))
print(h_disabled)

h_enabled <- handler_void(enable = TRUE)
stopifnot(inherits(h_enabled, "void_progression_handler"))
print(h_enabled)

# 2. Test manual progression calls when enable = FALSE
h_disabled(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
h_disabled(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
h_disabled(progression(type = "finish", progressor_uuid = "uuid-1", progression_index = 3L))

# 3. Test manual progression calls when enable = TRUE
h_enabled(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-2", progression_index = 1L))
h_enabled(progression(type = "update", amount = 1, progressor_uuid = "uuid-2", progression_index = 2L))
h_enabled(progression(type = "finish", progressor_uuid = "uuid-2", progression_index = 3L))

# 4. Run inside with_progress
for (enable in c(FALSE, TRUE)) {
  message(sprintf("with_progress(..., handlers = handler_void(enable = %s))", enable))
  with_progress({
    p <- progressor(along = 1:5)
    for (i in 1:5) {
      Sys.sleep(getOption("progressr.demo.delay", 0.1))
      p()
    }
  }, handlers = handler_void(enable = enable))
}

message("handler_void() ... done")
