#' A progressr handler useful for Futureverse tutorials
#'
#' @inheritParams make_progression_handler
#' 
#' @param \ldots Arguments passed to the selected progress handler.
#'
#' @param spec The progress handler to use.
#'
#' @param type Controls which predefined handler format string to use.
#'
#' @return A function of class `progression_handler` that takes a
#' [progression] condition as its first and only argument.
#'
#' @details
#' The default is to use the \pkg{progress} package. Contrary to the
#' \pkg{cli} package, the \pkg{progress} package has the capacity to
#' display _all_ progress updates, even when receiving progress updates
#' at a high rate from, for example, parallel processing.
#' 
#' @examples
#' # Display progress and keep the progress output when done
#' handlers("tutorial")
#' 
#' # Display progress and keep every progress reported
#' handlers("tutorial", "newline")
#' 
#' @export
handler_tutorial <- function(..., spec = c("progress", "cli"), type = "time", clear = FALSE) {
  spec <- match.arg(spec)
  if (!requireNamespace(spec, quietly = TRUE)) {
    stop(sprintf("Please install package: %s", sQuote(spec)))
  }
  if (spec == "cli") {
    handler_cli(..., type = type, clear = clear)
  } else if (spec == "progress") {
    handler_progress(..., type = type, clear = clear)
  }
}
