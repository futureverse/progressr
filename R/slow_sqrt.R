#' Slowly Calculate Square Roots of Elements
#'
#' @param x Numeric vector to calculate square roots for.
#'
#' @param delay Delay in seconds after each calculation.
#'
#' @param stdout If TRUE, then a text is outputted to the standard output
#' per element.
#'
#' @param message If TRUE, then a message is outputted per element.
#'
#' @param sticky If TRUE, then a "sticky" message is outputted every
#' ten element.
#'
#' @return The square roots of all elements in `x` as a numeric vector.
#'
#' @section Progress updates:
#' This function signals [progression] conditions as it progresses.
#'
#' @keywords internal
#' @export
slow_sqrt <- function(x, delay = getOption("progressr.demo.delay", 1.0), stdout = FALSE, message = TRUE, sticky = TRUE) {
  ## Hidden options to simplify help asciicast examples
  if (missing(stdout)) stdout <- getOption("progressr.slow_sqrt.stdout", FALSE)
  if (missing(message)) message <- getOption("progressr.slow_sqrt.message", TRUE)
  if (missing(sticky)) sticky <- getOption("progressr.slow_sqrt.sticky", TRUE)

  p <- progressor(along = x)

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
