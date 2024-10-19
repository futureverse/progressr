#' Progression Handler: Progress Reported via the Ntfy.sh Messaging Service
#'
#' A progression handler for `ntfy_send()` of the \pkg{ntfy} package,
#' which sends notifications via the <https://ntfy.sh> framework.
#'
#' @inheritParams make_progression_handler
#' @inheritParams ntfy::ntfy_send
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @example incl/handler_ntfy.R
#'
#' @section Requirements:
#' This progression handler requires the \pkg{ntfy} package, which is only
#' available from <https://github.com/jonocarroll/ntfy>.
#'
#' @keywords internal
#' @export
handler_ntfy <- function(intrusiveness = getOption("progressr.intrusiveness.ntfy", 5), target = "gui", ..., title = "Progress update from R") {
  ## Used for package testing purposes only when we want to perform
  ## everything except the last part where the backend is called
  ntfy_send <- function(...) NULL
  if (!is_fake("handler_ntfy")) {
    pkg <- "ntfy"
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop("Package 'ntfy' is not available. See ?progressr::handler_ntfy() for installation instructions")
    }
    ntfy_send <- get("ntfy_send", mode = "function", envir = getNamespace(pkg))
  }

  notifier <- function(title, message) {
    args <- list(
      message = message,
      title   = title
    )

    do.call(ntfy_send, args = args)
  }

  reporter <- local({
    finished <- FALSE
    
    list(
      reset = function(...) {
        finished <<- FALSE
      },
      
      initiate = function(config, state, progression, ...) {
        if (!state$enabled || config$times == 1L) return()
        progress_notify(title = title, step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
      },
        
      interrupt = function(config, state, progression, ...) {
        msg <- conditionMessage(progression)
        progress_notify(title = title, step = state$step, max_steps = config$max_steps, message = msg, notifier = notifier)
      },

      update = function(config, state, progression, ...) {
        if (!state$enabled || progression$amount == 0 || config$times <= 2L) return()
        progress_notify(title = title, step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
      },
        
      finish = function(config, state, progression, ...) {
        if (finished) return()
        if (!state$enabled) return()
        if (state$delta > 0) progress_notify(title = title, step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
	finished <<- TRUE
      }
    )
  })
  
  make_progression_handler("ntfy", reporter, intrusiveness = intrusiveness, target = target, ...)
}


