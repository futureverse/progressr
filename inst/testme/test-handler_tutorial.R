library(progressr)

options(progressr.clear = FALSE)

message("handler_tutorial() ...")

# 1. Test basic function properties and invalid arguments
stopifnot(
  is.function(handler_tutorial)
)

err <- tryCatch(handler_tutorial(spec = "invalid"), error = identity)
stopifnot(inherits(err, "error"))

# 2. Test progress spec
if (requireNamespace("progress", quietly = TRUE)) {
  h1 <- handler_tutorial(spec = "progress")
  stopifnot(inherits(h1, "progress_progression_handler"))
  
  with_progress({
    p <- progressor(along = 1:2)
    for (i in 1:2) p()
  }, handlers = h1)
}

# 3. Test cli spec
if (requireNamespace("cli", quietly = TRUE)) {
  h2 <- handler_tutorial(spec = "cli")
  stopifnot(inherits(h2, "cli_progression_handler"))
  
  with_progress({
    p <- progressor(along = 1:2)
    for (i in 1:2) p()
  }, handlers = h2)
}

message("handler_tutorial() ... done")
