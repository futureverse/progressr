#' Progression Handler: Progress Reported as "JGauge" Incremental Tones (Audio)
#'
#' A progression handler that reports progress using incremental tones
#' as JGauge Progress Bar Monitor (1).
#'
#' @inheritParams make_progression_handler
#'
#' @param freq_range (numeric vector of length two) Lower and upper
#' frequencies (Hz) tones representing 0% and 100% progress, respectively.
#'
#' @param \ldots Additional arguments passed to [make_progression_handler()].
#'
#' @example incl/handler_jgauge.R
#'
#' @section Requirements:
#' This progression handler requires an audio player.
#'
#' @references
#' 1. Doug Lee, JGauge Progress Bar Monitoring Scripts For JAWS 2018 and
#'    Later, <https://www.dlee.org/jgauge/>
#'
#' @export
handler_jgauge <- function(freq_range = c(220, 880), intrusiveness = getOption("progressr.intrusiveness.audio", 5.0), target = "audio", ...) {
  stopifnot(
    length(freq_range) == 2L, is.numeric(freq_range), all(is.finite(freq_range)),
    all(freq_range > 0), freq_range[2] > freq_range[1]
  )

  find_play <- local({
    bin <- NULL
    function(cmd = "play") {
      if (!is.null(bin)) return(bin)
      tmp <- Sys.which(cmd)
      stopifnot(nzchar(tmp))
      bin <<- tmp
      bin
    }
  }) # find_play()
    
  progress_freq <- function(ratio, freq_range = c(220, 880)) {
    stopifnot(length(ratio) == 1, is.numeric(ratio), is.finite(ratio),
              ratio >= 0, ratio <= 1)
    span <- log2(freq_range[2]) - log2(freq_range[1])
    freq <- 2^(log2(freq_range[1]) + ratio * span)
    freq
  } # progress_freq()

  ## Used for package testing purposes only when we want to perform
  ## everything except the last part where the backend is called
  if (!is_fake("handler_jgauge")) {
    jgauge_play <- function(freqs) {
      freqs <- round(freqs)
      duration <- 0.005
      amps <- c(0.30, 0.08, 0.08)
      tones <- mapply(freqs, amps, FUN = function(freq, amp) {
        c("synth", duration, "sine", freq, "vol", amp)
      }, SIMPLIFY = FALSE, USE.NAMES = FALSE)
      args <- c("--no-show-progress", "--null", unlist(tones, use.names = FALSE))
      cat(paste(args, collapse = " "), "\n", sep = "")

      bin <- find_play()
      system2(bin, args = args, stdout = TRUE, stderr = TRUE)
    } # jgauge_play()
  } else {
    jgauge_play <- function(freqs) NULL
  }

  ## Reporter state
  reporter <- local({
    list(
      initiate = function(config, state, progression, ...) {
        if (!state$enabled || config$times == 1L) return()
#	jgauge_play(c(freq_range[1], freq_range))
      },
        
      interrupt = function(config, state, progression, ...) {
      },
      
      update = function(config, state, progression, ...) {
        if (!state$enabled || progression$amount == 0 || config$times <= 2L) return()
        ratio <- if (config$max_steps == 0) 1 else state$step / config$max_steps
        freqs <- c(progress_freq(ratio, freq_range), freq_range)
	jgauge_play(freqs)
      },
        
      finish = function(config, state, progression, ...) {
        if (!state$enabled) return()
#	jgauge_play(c(freq_range[2], freq_range))
      }
    )
  })
  
  make_progression_handler("jgauge", reporter, intrusiveness = intrusiveness, target = target, ...)
}
