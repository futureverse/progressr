if (requireNamespace("cli", quietly = TRUE)) {
  library(progressr)
  options(progressr.clear = FALSE)
  
  message("handler_pbcol ...")
  
  # 1. Test the internal pbcol() function directly
  pbcol <- progressr:::pbcol
  
  message("Testing pbcol() internals ...")
  
  # Test default parameters and basic outputs
  res <- pbcol(fraction = 0.0)
  stopifnot(is.character(res))
  
  res <- pbcol(fraction = 0.5, msg = "Hello")
  stopifnot(is.character(res))
  
  res <- pbcol(fraction = 1.0, msg = "Hello")
  stopifnot(is.character(res))
  
  # Test adjust parameter
  for (adjust in c(0.0, 0.5, 1.0)) {
    res <- pbcol(fraction = 0.5, msg = "Hello", adjust = adjust)
    stopifnot(is.character(res))
  }
  
  # Test msg = NULL / length 0
  res <- pbcol(fraction = 0.5, msg = character(0))
  stopifnot(is.character(res))
  
  res <- pbcol(fraction = 0.5, msg = NULL)
  stopifnot(is.character(res))
  
  # Test truncation when message is too long
  res <- pbcol(fraction = 0.5, msg = paste(rep("x", 200), collapse = ""), width = 40)
  stopifnot(is.character(res))
  
  # Test custom complete / incomplete functions
  res <- pbcol(fraction = 0.5, msg = "Hello", complete = NULL, incomplete = NULL)
  stopifnot(is.character(res))
  
  res <- pbcol(fraction = 0.5, msg = "Hello", complete = function(s) paste0("[C:", s, "]"), incomplete = function(s) paste0("[I:", s, "]"))
  stopifnot(is.character(res))
  
  # Test invalid inputs (should throw errors)
  assert_error <- function(expr) {
    res <- tryCatch(eval(expr), error = identity)
    stopifnot(inherits(res, "error"))
  }
  
  assert_error(pbcol(msg = 123))
  assert_error(pbcol(msg = c("a", "b")))
  assert_error(pbcol(fraction = -0.1))
  assert_error(pbcol(fraction = 1.1))
  assert_error(pbcol(fraction = NA_real_))
  assert_error(pbcol(fraction = c(0.1, 0.2)))
  assert_error(pbcol(width = 0L))
  assert_error(pbcol(width = -5L))
  assert_error(pbcol(width = NA_integer_))
  assert_error(pbcol(adjust = -0.1))
  assert_error(pbcol(adjust = 1.1))
  
  
  # 2. Test the progression handler directly on various progression conditions
  message("Testing handler_pbcol() on progression conditions ...")
  
  h <- handler_pbcol(clear = FALSE)
  stopifnot(inherits(h, "pbcol_progression_handler"))
  
  # Run standard progression lifecycle
  h(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
  h(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
  h(progression(type = "update", amount = 0, progressor_uuid = "uuid-1", progression_index = 3L))
  # Negative amount to trigger state$delta < 0 branch
  h(progression(type = "update", amount = -1, progressor_uuid = "uuid-1", progression_index = 4L))
  h(progressr:::control_progression("hide"))
  h(progressr:::control_progression("unhide"))
  h(progressr:::control_progression("interrupt", message = "Interrupt message"))
  h(progressr:::control_progression("shutdown"))
  
  # Run with clear = TRUE
  h_clear <- handler_pbcol(clear = TRUE)
  h_clear(progression(type = "initiate", steps = 5, auto_finish = TRUE, progressor_uuid = "uuid-2", progression_index = 1L))
  h_clear(progression(type = "update", amount = 1, progressor_uuid = "uuid-2", progression_index = 2L))
  h_clear(progression(type = "finish", progressor_uuid = "uuid-2", progression_index = 3L))
  
  # Run with times <= 2L (returns early in reporter functions)
  h_times <- handler_pbcol(times = 2L)
  h_times(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-3", progression_index = 1L))
  h_times(progression(type = "update", amount = 1, progressor_uuid = "uuid-3", progression_index = 2L))
  h_times(progressr:::control_progression("unhide"))
  h_times(progressr:::control_progression("interrupt", message = "Interrupt message"))
  h_times(progressr:::control_progression("shutdown"))
  
  # Run with max_steps = 0
  h_zero <- handler_pbcol()
  h_zero(progression(type = "initiate", steps = 0, auto_finish = TRUE, progressor_uuid = "uuid-4", progression_index = 1L))
  h_zero(progressr:::control_progression("shutdown"))
  
  # Run with enable_after > 0 (enabled = FALSE initially)
  h_enable <- handler_pbcol(enable_after = 100.0)
  h_enable(progression(type = "initiate", steps = 10, auto_finish = TRUE, progressor_uuid = "uuid-5", progression_index = 1L))
  h_enable(progression(type = "update", amount = 1, progressor_uuid = "uuid-5", progression_index = 2L))
  h_enable(progressr:::control_progression("unhide"))
  h_enable(progressr:::control_progression("interrupt", message = "Interrupt message"))
  h_enable(progressr:::control_progression("shutdown"))
  
  # Test different crayon.enabled settings
  options(crayon.enabled = FALSE)
  h_crayon_false <- handler_pbcol()
  h_crayon_false(progression(type = "initiate", steps = 5, auto_finish = TRUE, progressor_uuid = "uuid-6", progression_index = 1L))
  h_crayon_false(progression(type = "update", amount = 1, progressor_uuid = "uuid-6", progression_index = 2L))
  h_crayon_false(progressr:::control_progression("shutdown"))
  
  options(crayon.enabled = TRUE)
  h_crayon_true <- handler_pbcol()
  h_crayon_true(progression(type = "initiate", steps = 5, auto_finish = TRUE, progressor_uuid = "uuid-7", progression_index = 1L))
  h_crayon_true(progression(type = "update", amount = 1, progressor_uuid = "uuid-7", progression_index = 2L))
  h_crayon_true(progressr:::control_progression("shutdown"))
  
  
  # 3. Test using standard with_progress() flow
  message("Testing handler_pbcol() with standard with_progress() flow ...")
  
  for (x in list(integer(0), 1:10, 1L)) {
    message("length(x): ", length(x))
    with_progress({
      progress <- progressor(along = x)
      for (ii in x) {
        Sys.sleep(getOption("progressr.demo.delay", 0.1))
        progress(message = sprintf("(%s)", paste(letters[1:ii], collapse="")))
      }
    }, handlers = handler_pbcol())
  }
  
  message("handler_pbcol ... done")
} ## if (requireNamespace("cli", ...))

