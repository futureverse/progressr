#' Progression Handler: Progress Reported in the Terminal Title
#'
#' A progression handler that reports on progress in the title of the
#' terminal window or tab, e.g. `[ 42%] 21/50 | ETA 00:12 | message`.
#' This is useful when the terminal is in the background, or when the
#' console is busy with other output.
#'
#' @inheritParams make_progression_handler
#'
#' @param spinner (character vector) Symbols to cycle through on each
#' progress update, including updates with `amount = 0`, which signal that
#' the process is still alive. If `NULL`, no spinner is shown. The default
#' is a set of Unicode braille symbols, if the current locale supports
#' UTF-8, otherwise `-`, `\`, `|`, and `/`.
#'
#' @param file (connection) A [base::connection] to where the escape
#' sequences that set the terminal title should be sent.
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @return A function of class `progression_handler` that takes a
#' [progression] condition as its first and only argument.
#'
#' @details
#' The terminal title is set using the xterm "OSC 0" escape sequence,
#' which is supported by most modern terminals, e.g. xterm, GNOME Terminal,
#' Konsole, macOS Terminal, iTerm2, and Windows Terminal. Inside `tmux`
#' and GNU `screen`, it sets the title of the pane or window, which is
#' displayed by the outer terminal only if the multiplexer is configured
#' to do so, e.g. `set-option -g set-titles on` for `tmux`.
#'
#' When progress completes, or is interrupted, the terminal title is
#' restored using the xterm title stack. Terminals that do not support
#' the title stack are instead reset to an empty title, which most
#' terminals display as their default title.
#'
#' This handler outputs nothing, if `file` is not a terminal, if the
#' terminal is a "dumb" terminal, or if R runs in the RStudio Console or
#' in Emacs. On MS Windows, it outputs only when R runs in a terminal known
#' to support escape sequences, e.g. Windows Terminal.
#'
#' Since the terminal title does not interfere with the output in the
#' console, this handler can be combined with other progression handlers,
#' e.g. `handlers(c("txtprogressbar", "terminal_title"))`.
#'
#' @example incl/handler_terminal_title.R
#'
#' @importFrom utils flush.console
#' @export
handler_terminal_title <- function(spinner = NULL, file = stderr(), intrusiveness = getOption("progressr.intrusiveness.gui", 1), target = "gui", ...) {
  if (is.null(spinner)) {
    spinner <- if (isTRUE(l10n_info()[["UTF-8"]])) {
      c("\u280B", "\u2819", "\u2839", "\u2838", "\u283C",
        "\u2834", "\u2826", "\u2827", "\u2807", "\u280F")
    } else {
      c("-", "\\", "|", "/")
    }
  }
  stop_if_not(is.character(spinner))

  supported <- terminal_title_supported(file)

  cat_ <- function(...) {
    cat(..., sep = "", file = file)
    flush.console()
  }

  reporter <- local({
    pushed <- FALSE
    t0 <- NULL
    spin_state <- 0L

    restore_title <- function() {
      if (!pushed) return()
      ## Fall back to an empty title, if the title stack is not supported
      cat_(osc_title(""), "\033[23;0t")
      pushed <<- FALSE
    }

    redraw_title <- function(config, state) {
      if (!pushed) {
        ## Push current title onto the title stack
        cat_("\033[22;0t")
        pushed <<- TRUE
      }
      if (is.null(t0)) t0 <<- Sys.time()
      spin <- if (length(spinner) > 0L) spinner[spin_state + 1L] else NULL
      title <- terminal_title(
        step = state$step,
        max_steps = config$max_steps,
        elapsed = difftime(Sys.time(), t0, units = "secs"),
        message = state$message,
        spin = spin
      )
      cat_(osc_title(title))
    }

    list(
      reset = function(...) {
        if (!supported) return()
        restore_title()
        t0 <<- NULL
        spin_state <<- 0L
      },

      initiate = function(config, state, ...) {
        if (!supported) return()
        t0 <<- Sys.time()
        if (!state$enabled) return()
        redraw_title(config, state)
      },

      hide = function(...) NULL,

      unhide = function(...) NULL,

      interrupt = function(...) {
        if (!supported) return()
        restore_title()
      },

      update = function(config, state, progression, ...) {
        if (!supported || !state$enabled) return()
        if (length(spinner) > 0L) {
          spin_state <<- (spin_state + 1L) %% length(spinner)
        }
        redraw_title(config, state)
      },

      finish = function(...) {
        if (!supported) return()
        restore_title()
        t0 <<- NULL
        spin_state <<- 0L
      }
    )
  })

  make_progression_handler("terminal_title", reporter, intrusiveness = intrusiveness, target = target, ...)
}


osc_title <- function(title) {
  paste0("\033]0;", title, "\007")
}


## Format the terminal title, e.g. "[ 42%] 21/50 | ETA 00:12 | message"
terminal_title <- function(step, max_steps, elapsed = NULL, message = NULL, spin = NULL) {
  ratio <- if (max_steps == 0) 1 else step / max_steps
  title <- sprintf("[%3.0f%%] %d/%d", 100 * ratio, step, max_steps)
  if (!is.null(spin)) title <- paste(spin, title)

  if (!is.null(elapsed) && step > 0 && step < max_steps) {
    elapsed <- as.numeric(elapsed, units = "secs")
    eta <- elapsed / step * (max_steps - step)
    title <- paste(title, "| ETA", format_hms(eta))
  }

  if (length(message) > 0L) {
    message <- paste(message, collapse = " ")
    ## Drop ANSI escape sequences and control characters, which would
    ## otherwise corrupt the escape sequence for setting the title
    message <- gsub("\033\\[[0-9;?]*[A-Za-z]", "", message)
    message <- gsub("[[:cntrl:]]", " ", message)
    message <- trim(message)
    if (nzchar(message)) title <- paste(title, "|", message)
  }

  title
}


format_hms <- function(secs) {
  secs <- round(secs)
  h <- secs %/% 3600
  m <- (secs %% 3600) %/% 60
  s <- secs %% 60
  if (h > 0) {
    sprintf("%d:%02d:%02d", h, m, s)
  } else {
    sprintf("%02d:%02d", m, s)
  }
}


## Is 'file' a terminal that supports setting the title?
terminal_title_supported <- function(file = stderr()) {
  if (!isatty(file)) return(FALSE)

  ## The RStudio Console (but not the RStudio Terminal)
  if (Sys.getenv("RSTUDIO") == "1" && !nzchar(Sys.getenv("RSTUDIO_TERM"))) {
    return(FALSE)
  }

  ## Emacs, e.g. ESS
  if (nzchar(Sys.getenv("INSIDE_EMACS"))) return(FALSE)

  term <- Sys.getenv("TERM")
  if (term == "dumb") return(FALSE)

  if (.Platform[["OS.type"]] == "windows") {
    ## Windows Terminal, ConEmu, mintty, VS Code, ...
    return(nzchar(Sys.getenv("WT_SESSION")) ||
           Sys.getenv("ConEmuANSI") == "ON" ||
           nzchar(Sys.getenv("TERM_PROGRAM")) ||
           nzchar(term))
  }

  nzchar(term)
}
