#' Progression Handler: Progress Reported via the Operating-System Notification Framework (GUI, Text)
#'
#' A progression handler for `notify()` of the \pkg{notifier} package.
#'
#' @inheritParams make_progression_handler
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @example incl/handler_notifier.R
#'
#' @section Requirements:
#' This progression handler requires the \pkg{notifier} package, which is only
#' available from <https://github.com/gaborcsardi/notifier>.  This can be
#' installed as `remotes::install_github("gaborcsardi/notifier@62d484")`.
#'
#' @export
handler_notifier <- function(intrusiveness = getOption("progressr.intrusiveness.notifier", 10), target = "gui", ...) {
  ## Used for package testing purposes only when we want to perform
  ## everything except the last part where the backend is called
  if (!is_fake("handler_notifier")) {
    pkg <- "notifier"
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop("Package 'notifier' is not available. See ?progressr::handler_notifier() for installation instructions")
    }
    notifier_ <- get("notify", mode = "function", envir = getNamespace(pkg))
    notifier <- function(title = "R 'progressr' notification", message, ...) {
      notifier_(msg = message, title = title)
    }
  } else {
    notifier <- function(title = "R 'progressr' notification", message, ...) NULL
  }

  reporter <- local({
    finished <- FALSE
    
    list(
      reset = function(...) {
        finished <<- FALSE
      },
      
      interrupt = function(config, state, progression, ...) {
        msg <- conditionMessage(progression)
        progress_notify(step = state$step, max_steps = config$max_steps, message = msg, notifier = notifier)
      },

      initiate = function(config, state, progression, ...) {
        if (!state$enabled || config$times == 1L) return()
        progress_notify(step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
      },
        
      update = function(config, state, progression, ...) {
        if (!state$enabled || progression$amount == 0 || config$times <= 2L) return()
        progress_notify(step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
      },
        
      finish = function(config, state, progression, ...) {
        if (finished) return()
        if (!state$enabled) return()
        if (state$delta > 0) {
          progress_notify(step = state$step, max_steps = config$max_steps, message = state$message, notifier = notifier)
        }
	finished <<- TRUE
      }
    )
  })
  
  make_progression_handler("notifier", reporter, intrusiveness = intrusiveness, target = target, ...)
}
