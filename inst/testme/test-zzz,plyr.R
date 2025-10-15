library(progressr)

if (requireNamespace("plyr", quietly = TRUE)) {
  message("* with_progress()")

  with_progress({
    y <- plyr::llply(3:6, function(n, ...) {
      slow_sum(1:n, stdout=TRUE, message=TRUE)
    }, .progress = "progressr")
  })



  message("* global progression handler")

  handlers(global = TRUE)
    
  local({
    y <- plyr::llply(3:6, function(n, ...) {
      slow_sum(1:n, stdout=TRUE, message=TRUE)
    }, .progress = "progressr")
  })
    
  handlers(global = FALSE)
}

