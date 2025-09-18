#' Progression Handler: Slow Down Progress Reporting
#'
#' @inheritParams make_progression_handler
#'
#' @param duration (numeric) Added slowdown (in seconds) across all progress
#' steps, e.g. if `duration = 10.0` and `steps = 100L`, then each step unit is
#' delayed 0.1 seconds, totaling a ten-second slowdown.
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @examples
#' \donttest{\dontrun{
#' handlers(handler_slowdown(duration = 30.0)) ## 30-second total slowdown
#' with_progress(y <- slow_sum(1:100))
#' print(y)
#' }}
#'
#' @details
#' This progression handler delays each progress step a certain number of
#' seconds. It does not render any output.
#'
#' @export
handler_slowdown <- function(duration = 10.0, intrusiveness = 0, target = "void", enable = getOption("progressr.enable", TRUE), ...) {
  stopifnot(
    length(duration) == 1L, is.numeric(duration),
    is.finite(duration), duration >= 0
  )
  reporter <- local({
    list(
      initiate = function(config, state, progression, ...) NULL,
      
      update = function(config, state, progression, ...) {
        if (!state$enabled) return()
        delta <- duration / config$max_steps ## delay per step unit
        Sys.sleep(progression$amount * delta)
      },
      
      finish = function(config, state, progression, ...) NULL
    )
  })
  
  make_progression_handler("slowdown", reporter, intrusiveness = intrusiveness, target = target, enable = enable, ...)
}
