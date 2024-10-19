progress_notify <- function(title = "R 'progressr' notification", message, step, max_steps, notifier) {
  stop_if_not(is.function(notifier))
  
  ratio <- if (max_steps == 0) 1 else step / max_steps
  ratio <- sprintf("%.0f%%", 100*ratio)
  msg <- paste(c("", message), collapse = "")
  body <- sprintf("[%s] %s", ratio, msg)
  
  notifier(title = title, message = body)
} ## progress_notify()
