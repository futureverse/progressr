check_full <- (Sys.getenv("_R_CHECK_FULL_") != "")

covr <- ("covr" %in% loadedNamespaces())
on_macos <- grepl("^darwin", R.version$os)
on_githubactions <- as.logical(Sys.getenv("GITHUB_ACTIONS", "FALSE"))

is_rstudio_console <- function() {
  (Sys.getenv("RSTUDIO") == "1") && !nzchar(Sys.getenv("RSTUDIO_TERM"))
}

# WORKAROUND: Make sure tests also work with 'covr' package
if (covr) {
  globalenv <- function() parent.frame()
  baseenv <- function() environment(base::sample)
}

