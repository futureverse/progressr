#' Slowly Calculate Sum or Square Roots of Elements
#'
#' @param x Numeric vector to sum or calculate square roots for.
#'
#' @param delay Delay in seconds after each addition/calculation.
#'
#' @param stdout If TRUE, then a text is outputted to the standard output
#' per element.
#'
#' @param message If TRUE, then a message is outputted per element.
#'
#' @param sticky If TRUE, then a "sticky" message is outputted every
#' ten element.
#'
#' @param progress If TRUE, then a progressor is created, otherwise a void
#' progressor that does nothing is used.
#'
#' @return The sum or square roots of all elements in `x`.
#'
#' @section Progress updates:
#' These functions signal [progression] conditions as they progress.
#'
#' @keywords internal
#' @export
slow_sum_p <- function(x, delay = getOption("progressr.demo.delay", 1.0), stdout = getOption("progressr.demo.stdout", FALSE), message = getOption("progressr.demo.message", TRUE), sticky = getOption("progressr.demo.sticky", TRUE), progress = getOption("progressr.demo.progress", TRUE)) {
  ## Hidden options to simplify help asciicast examples
  if (missing(stdout)) stdout <- getOption("progressr.slow_sum_p.stdout", stdout)
  if (missing(message)) message <- getOption("progressr.slow_sum_p.message", message)
  if (missing(sticky)) sticky <- getOption("progressr.slow_sum_p.sticky", sticky)
  if (missing(progress)) progress <- getOption("progressr.slow_sum_p.progress", progress)

  if (progress) {
    p <- progressor(along = x)
  } else {
    p <- function(...) NULL
  }

  sum <- 0
  storage.mode(sum) <- storage.mode(x)
  
  for (kk in seq_along(x)) {
    p(amount = 0)   ## "I'm alive" progression update
    Sys.sleep(0.2*delay)
    if (stdout) cat(sprintf("O: Element #%d\n", kk))
    Sys.sleep(0.2*delay)
    p(amount = 0)
    Sys.sleep(0.2*delay)
    sum <- sum + x[kk]
    p(message = sprintf("P: Adding %g", kk))
    Sys.sleep(0.2*delay)
    if (message) message(sprintf("M: Added value %g", x[kk]))
    p(amount = 0)
    Sys.sleep(0.2*delay)
    if (sticky && kk %% 10 == 0) {
      p(
        amount = 0,
        message = sprintf("P: %d elements done", kk),
        class = "sticky"
      )
    }
  }

  p(amount = 0)

  sum
}

#' @rdname slow_sum_p
#' @export
slow_sum <- function(x, delay = getOption("progressr.demo.delay", 1.0), stdout = FALSE, message = FALSE, sticky = FALSE, progress = FALSE) {
  slow_sum_p(x = x, delay = delay, stdout = stdout, message = message, sticky = sticky, progress = progress)
}

#' @rdname slow_sum_p
#' @export
slow_sqrt_p <- function(x, delay = getOption("progressr.demo.delay", 0.5), stdout = getOption("progressr.demo.stdout", FALSE), message = getOption("progressr.demo.message", TRUE), sticky = getOption("progressr.demo.sticky", TRUE), progress = getOption("progressr.demo.progress", TRUE)) {
  ## Hidden options to simplify help asciicast examples
  if (missing(stdout)) stdout <- getOption("progressr.slow_sqrt_p.stdout", stdout)
  if (missing(message)) message <- getOption("progressr.slow_sqrt_p.message", message)
  if (missing(sticky)) sticky <- getOption("progressr.slow_sqrt_p.sticky", sticky)
  if (missing(progress)) progress <- getOption("progressr.slow_sqrt_p.progress", progress)

  if (progress) {
    p <- progressor(along = x)
  } else {
    p <- function(...) NULL
  }

  res <- numeric(length(x))
  for (kk in seq_along(x)) {
    p(amount = 0)   ## "I'm alive" progression update
    Sys.sleep(0.2*delay)
    if (stdout) cat(sprintf("O: Element #%d\n", kk))
    Sys.sleep(0.2*delay)
    p(amount = 0)
    Sys.sleep(0.2*delay)
    res[kk] <- sqrt(x[kk])
    p(message = sprintf("P: Calculating sqrt(%g)", kk))
    Sys.sleep(0.2*delay)
    if (message) message(sprintf("M: Calculated value %g", res[kk]))
    p(amount = 0)
    Sys.sleep(0.2*delay)
    if (sticky && kk %% 10 == 0) {
      p(
        amount = 0,
        message = sprintf("P: %d elements done", kk),
        class = "sticky"
      )
    }
  }

  p(amount = 0)

  res
}

#' @rdname slow_sum_p
#' @export
slow_sqrt <- function(x, delay = getOption("progressr.demo.delay", 0.5), stdout = FALSE, message = FALSE, sticky = FALSE, progress = FALSE) {
  slow_sqrt_p(x = x, delay = delay, stdout = stdout, message = message, sticky = sticky, progress = progress)
}
