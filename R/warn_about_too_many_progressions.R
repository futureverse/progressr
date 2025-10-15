warn_about_too_many_progressions <- function(progression, global = FALSE) {
  ## We might receive progress updates after the fact that the progressor
  ## has been completed

  ## It is okay if it's a zero-amount progression
  amount <- progression$amount
  if (is.numeric(amount) && amount == 0) return()

  ## It is okay if it's a 'finish' progression
  type <- progression$type
  if (is.character(type) && type == "finish") return()

  ## This is okay if it's signaled from within with_progress() and then
  ## caught by the global 'progression' handler
  if (global) {
    ## ... unless the 'progression' signaled within with_progress(), which
    ## in case it might be re-signaled such that it reaches the global
    ## 'progression' handler here
    is_with_progress <- function(call) {
      identical(call, quote(with_progress)) || identical(call, quote(progressr::with_progress))
    }
    calls <- lapply(sys.calls(), FUN = .subset2, 1L)
    if (any(vapply(calls, FUN = is_with_progress, FUN.VALUE = FALSE))) {
      return()
    }
  }

  ## In all cases, this is a mistake that we should warn about
  m <- conditionMessage(progression)
  m <- if (length(m) == 0) "character(0)" else sQuote(m)
  info <- sprintf("amount=%g; msg=%s", amount, m)
  msg <- if (global) "The global progression handlers" else "with_progress()"
  msg <- sprintf("%s received a progression %s request (%s), but is no longer listening to this progressor. This can happen when code signals more progress updates than steps in the progressor. To troubleshoot this, retry with progressr::handlers(\"debug\")", msg, sQuote(type), info)
  warning(msg, call. = FALSE, immediate. = TRUE)
} ## warn_about_too_many_progressions()
