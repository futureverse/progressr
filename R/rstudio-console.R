getRStudioVersion <- function() {
  if (!"tools:rstudio" %in% search()) return(package_version("0.0"))
  envir <- as.environment("tools:rstudio")
  RStudio.Version <- get("RStudio.Version", mode = "function", envir = envir, inherits = FALSE)
  RStudio.Version()[["version"]]
}

#' @importFrom utils packageVersion
warnAboutRStudioMessageHandler <- function() {
  ## Not RStudio Console?
  if (Sys.getenv("RSTUDIO") != "1" || nzchar(Sys.getenv("RSTUDIO_TERM"))) {
    return()
  }

  ## Unaffected version of RStudio?
  if (getRStudioVersion() < "2025.5.0") return()

  ## No global condition handler for "message":s?
  handler <- globalCallingHandlers()[["message"]]
  if (is.null(handler)) return()

  ## Not one of RStudio's custom handlers?
  code <- deparse(body(handler))
  search <- ".rs.globalCallingHandlers.onMessageImpl"
  if (!any(grepl(search, code, fixed = TRUE))) return()

  msg <- sprintf("You are running RStudio %s, which has a custom conditional handler for messages that is incompatible with some of the progress handlers in progressr %s, e.g. 'cli'. Until fixed, one workaround is to disable RStudio's custom handlers, by going to 'Tools' -> 'Global Options ...' -> 'Console' and switch 'Use Extended Display' to 'Errors and Warnings only'. See <https://github.com/futureverse/progressr/issues/179> for further details", getRStudioVersion(), packageVersion("progressr"))
  warning(msg, call. = FALSE, immediate. = FALSE)
}
