#' Progression Handler: Progress Reported as 'BRRR' Sounds (Audio)
#'
#' A progression handler for `skrrrahh()` of the \pkg{BRRR} package.
#'
#' @inheritParams make_progression_handler
#'
#' @return A function of class `progression_handler` that takes a
#' [progression] condition as its first and only argument.
#'
#' @param initiate,update,finish,interrupt (integer or character) Indices or
#' names of `skrrrahh()` sounds to play when progress starts, is updated,
#' completes, or is interrupted. For silence, use `NA_integer_`.
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @example incl/handler_brrr.R
#'
#' @section Requirements:
#' This progression handler requires the \pkg{BRRR} package, which is only
#' available from <https://github.com/brooke-watson/BRRR>.  This can be
#' installed as `remotes::install_github("brooke-watson/BRRR")`.
#'
#' @export
handler_brrr <- function(initiate = "takeoff", update = "bigsean4",  finish = "khaled3", interrupt = "busta", intrusiveness = getOption("progressr.intrusiveness.audio", 5.0), target = "audio", ...) {
  ## Used for package testing purposes only when we want to perform
  ## everything except the last part where the backend is called
  if (!is_fake("handler_brrr")) {
    pkg <- "BRRR"
    if (!requireNamespace(pkg, quietly = TRUE)) {
      stop(sprintf("Package '%s' is not available. See ?progressr::handler_notifier() for installation instructions", pkg))
    }
    BRRR_skrrrahh <- get("skrrrahh", mode = "function", envir = getNamespace(pkg))
  } else {
    BRRR_skrrrahh <- function(sound, expr) NULL
  }

  skrrrahh <- function(sound) {
    ## Silence?
    if (is.na(sound)) return()
    BRRR_skrrrahh(sound)
  }

  ## Reporter state
  reporter <- local({
    list(
      initiate = function(config, state, progression, ...) {
        if (!state$enabled || config$times == 1L) return()
        skrrrahh(initiate)
      },
        
      interrupt = function(config, state, progression, ...) {
        skrrrahh(interrupt)
      },
      
      update = function(config, state, progression, ...) {
        if (!state$enabled || progression$amount == 0 || config$times <= 2L) return()
        skrrrahh(update)
      },
        
      finish = function(config, state, progression, ...) {
        if (!state$enabled) return()
        skrrrahh(finish)
      }
    )
  })
  
  make_progression_handler("brrr", reporter, intrusiveness = intrusiveness, target = target, ...)
}
