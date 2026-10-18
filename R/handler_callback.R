#' Progression Handler: Progress Reported via a User-Defined Hook Function
#'
#' A progression handler that calls a custom hook function every time this
#' handler receives a progression update, e.g. to forward progress
#' information to logging, GUIs, or other external systems not supported
#' by \pkg{progressr}.
#'
#' @inheritParams make_progression_handler
#'
#' @return A function of class `progression_handler` that takes a
#' [progression] condition as its first and only argument.
#'
#' @param fcn (function) A hook function that is called whenever this
#' handler reports on an `"initiate"`, `"update"`, or `"finish"` event.
#' It is called as `fcn(type, step, max_steps, message, amount)`, where
#' `type` (character string) is one of `"initiate"`, `"update"`, or
#' `"finish"`, `step` (integer) is the number of steps completed so far,
#' `max_steps` (integer) is the total number of steps, `message`
#' (character string) is the latest progress message, and `amount`
#' (numeric) is the increment in `step` since the previous call. The
#' function should accept `...` to remain forward compatible with
#' future arguments. Any value returned by `fcn` is ignored.
#' If `NULL` (default), no hook function is called, i.e. this handler
#' produces no output.
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @example incl/handler_callback.R
#'
#' @export
handler_callback <- function(fcn = NULL, intrusiveness = getOption("progressr.intrusiveness.callback", 1), target = "callback", ...) {
  if (is.null(fcn)) fcn <- function(...) NULL
  stop_if_not(is.function(fcn))

  reporter <- local({
    call_fcn <- function(type, config, state) {
      fcn(type = type, step = state$step, max_steps = config$max_steps,
          message = state$message, amount = state$delta)
    }

    list(
      initiate = function(config, state, progression, ...) {
        call_fcn("initiate", config = config, state = state)
      },

      update = function(config, state, progression, ...) {
        call_fcn("update", config = config, state = state)
      },

      finish = function(config, state, progression, ...) {
        call_fcn("finish", config = config, state = state)
      }
    )
  })

  make_progression_handler("callback", reporter, intrusiveness = intrusiveness, target = target, ...)
}
