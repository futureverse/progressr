library(progressr)

options(progressr.clear = FALSE)

if (requireNamespace("progress", quietly = TRUE)) {
  
  # Save original fake handlers option
  old_fake_handlers <- getOption("progressr.tests.fake_handlers")
  
  # A helper to run tests for a given mode (fake or real)
  run_tests <- function(mode_label) {
    message(sprintf("Running handler_progress tests in %s mode...", mode_label))
    
    # 1. Test basic with_progress flow for all types
    for (type in c("default", "steps", "percent", "time")) {
      message(sprintf("handler_progress(type = '%s') ...", type))
      options(progressr.handlers = handler_progress(type = type))
      for (x in list(integer(0), 1:10, 1L)) {
        message("length(x): ", length(x))
        with_progress({
          progress <- progressor(along = x)
          for (ii in x) {
            Sys.sleep(getOption("progressr.demo.delay", 0.1))
            progress(message = sprintf("(%s)", paste(letters[1:ii], collapse="")))
          }
        })
      }
      message(sprintf("handler_progress(type = '%s') ... done", type))
    }
    
    # 2. Test manual progression inputs to cover internal states and branches
    # Test normal lifecycle with clear = FALSE
    h <- handler_progress(clear = FALSE)
    h(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
    h(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
    h(progression(type = "update", amount = 0, progressor_uuid = "uuid-1", progression_index = 3L))
    # Negative amount to trigger delta < 0
    h(progression(type = "update", amount = -1, progressor_uuid = "uuid-1", progression_index = 4L))
    # Sticky progression
    h(progression(type = "update", amount = 1, class = "sticky", message = "sticky message", progressor_uuid = "uuid-1", progression_index = 5L))
    h(progressr:::control_progression("hide"))
    h(progressr:::control_progression("unhide"))
    h(progressr:::control_progression("interrupt", message = "Interrupt message"))
    h(progressr:::control_progression("shutdown"))
    
    # Test lifecycle with clear = TRUE
    h_clear <- handler_progress(clear = TRUE)
    h_clear(progression(type = "initiate", steps = 5, auto_finish = TRUE, progressor_uuid = "uuid-2", progression_index = 1L))
    h_clear(progression(type = "update", amount = 1, progressor_uuid = "uuid-2", progression_index = 2L))
    h_clear(progressr:::control_progression("shutdown"))
    
    # Test times = 1L (returns early in initiate)
    h_times1 <- handler_progress(times = 1L)
    h_times1(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-3", progression_index = 1L))
    h_times1(progressr:::control_progression("shutdown"))
    
    # Test times <= 2L (returns early in update)
    h_times2 <- handler_progress(times = 2L)
    h_times2(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-4", progression_index = 1L))
    h_times2(progression(type = "update", amount = 1, progressor_uuid = "uuid-4", progression_index = 2L))
    h_times2(progressr:::control_progression("shutdown"))
    
    # Test max_steps = 0
    h_zero <- handler_progress()
    h_zero(progression(type = "initiate", steps = 0, auto_finish = TRUE, progressor_uuid = "uuid-5", progression_index = 1L))
    h_zero(progression(type = "update", amount = 0, progressor_uuid = "uuid-5", progression_index = 2L))
    h_zero(progressr:::control_progression("shutdown"))
    
    # Test enabled = FALSE initially (enable_after > 0)
    h_enable <- handler_progress(enable_after = 100.0)
    h_enable(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-6", progression_index = 1L))
    h_enable(progression(type = "update", amount = 1, progressor_uuid = "uuid-6", progression_index = 2L))
    h_enable(progressr:::control_progression("shutdown"))
    
    # Test pb$finished branches (auto_finish = FALSE and ticking to completion)
    h_finished <- handler_progress(clear = FALSE)
    h_finished(progression(type = "initiate", steps = 2, auto_finish = FALSE, progressor_uuid = "uuid-7", progression_index = 1L))
    h_finished(progression(type = "update", amount = 2, progressor_uuid = "uuid-7", progression_index = 2L))
    h_finished(progressr:::control_progression("hide"))
    h_finished(progressr:::control_progression("unhide"))
    h_finished(progressr:::control_progression("shutdown"))
  }
  
  # Run in Fake Mode (default config of testme)
  run_tests("fake")
  
  # Run in Real Mode
  # Clear is_fake cache and remove handler_progress from fake_handlers option
  env <- environment(progressr:::is_fake)
  env$cache <- list()
  options(progressr.tests.fake_handlers = setdiff(old_fake_handlers, "handler_progress"))
  
  run_tests("real")
  
  # Restore options
  options(progressr.tests.fake_handlers = old_fake_handlers)
  env$cache <- list()
}
