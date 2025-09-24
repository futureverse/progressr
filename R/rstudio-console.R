get_rstudio_version <- local({
  .version <- NULL
  function() {
    if (is.null(.version)) {
      .version <<- package_version("0.0")
      if ("tools:rstudio" %in% search()) {
        envir <- as.environment("tools:rstudio")
        ## There are cases where 'tools:rstudio' exist, but there is no
        ## RStudio.Version() function. See
        ## https://github.com/futureverse/progressr/issues/183 for
        ## an example. Not sure how that happens. /HB 2025-09-23
        if (exists("RStudio.Version", mode = "function", envir = envir, inherits = FALSE)) {
          RStudio.Version <- get("RStudio.Version", mode = "function", envir = envir, inherits = FALSE)
          .version <<- RStudio.Version()[["version"]]
        }
      }
    }
    .version
  }
})


patch_rstudio_console_evidence <- function() {
  res <- c(
    console = FALSE, ## In RStudio Console?
    version = FALSE, ## Affected RStudio version?
    message = FALSE, ## RStudio use custom message handler?
    warning = FALSE  ## RStudio use custom warning handler?
  )

  ## RStudio?
  if (Sys.getenv("RSTUDIO") == "1") {
    ## Not RStudio Terminal, i.e. RStudio Console?
    if (!nzchar(Sys.getenv("RSTUDIO_TERM"))) {
      res["console"] <- TRUE
    }

    ## RStudio v2025.5.0?
    if (get_rstudio_version() >= "2025.5.0" &&
        get_rstudio_version() <  "2025.5.1") {
      res["version"] <- TRUE
    }
  }

  ## No global message and warning handlers?
  handlers <- globalCallingHandlers()
  
  handler <- handlers[["message"]]
  if (is.null(handler)) {
    res["message"] <- TRUE
  } else {
    code <- deparse(body(handler))
    search <- ".rs.globalCallingHandlers.onMessageImpl"
    if (any(grepl(search, code, fixed = TRUE))) {
      res["message"] <- TRUE
    }
  }

  handler <- handlers[["warning"]]
  if (is.null(handler)) {
    res["warning"] <- TRUE
  } else {
    code <- deparse(body(handler))
    search <- ".rs.globalCallingHandlers.onWarningImpl"
    if (any(grepl(search, code, fixed = TRUE))) {
      res["warning"] <- TRUE
    }
  }

  res
}


patch_rstudio_console <- local({
  patch <- NA
  
  function(reset = FALSE) {
    if (isTRUE(reset)) patch <<- NA
    if (!is.na(patch)) return(patch)

    ## Always respect option
    opt <- getOption("progressr.rstudio.patch")
    if (is.logical(opt) && length(opt) == 1L && !is.na(opt)) {
      return(opt)
    }

    affected <- patch_rstudio_console_evidence()
    if (!all(affected)) {
      patch <<- FALSE
      return(FALSE)
    }

    TRUE
  }
})


#' @importFrom utils packageVersion
warn_about_rstudio_condition_handlers <- function() {
  affected <- patch_rstudio_console_evidence()
  if (!all(affected)) return()
  msg <- sprintf("You are running RStudio %s, which has a custom message and warning handlers that are incompatible with some of the progress handlers in progressr %s, e.g. 'cli'. Until fixed, one workaround is to disable RStudio's custom handlers, by going to 'Tools' -> 'Global Options ...' -> 'Console' and switch 'Use Extended Display' to 'Errors only'. See <https://github.com/futureverse/progressr/issues/179> for further details", get_rstudio_version(), packageVersion("progressr"))
  warning(msg, call. = FALSE, immediate. = FALSE)
}
