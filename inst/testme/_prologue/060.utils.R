non_supported_progression_handlers <- function() {
  names <- character(0L)
  for (pkg in c("beepr", "notifier", "pbmcapply", "progress", "shiny")) {
    if (!requireNamespace(pkg, quietly = TRUE))
      names <- c(names, pkg)
  }
  if (!"tcltk" %in% capabilities()) {
    names <- c(names, "tkprogressbar")
  }
  if (.Platform$OS.type != "windows") {
    names <- c(names, "winprogressbar")
  }
  if (!is_rstudio_console()) {
    names <- c(names, "rstudio")
  }
  if (!check_full) {
    names <- c(names, "notifier")
    names <- c(names, "shiny")
  }
  names <- unique(names)
  sprintf("handler_%s", names)
}


supported_progress_handlers <- function(exclude = non_supported_progression_handlers()) {
  handlers <- known_progression_handlers()
  drop <- na.omit(match(exclude, names(handlers)))
  if (length(drop) > 0L) handlers <- handlers[-drop]
  handlers
}


future_strategies <- c("multisession", "sequential")
if (.Platform$OS.type != "windows") {
  future_strategies <- c(future_strategies, "multicore")
}


capture_output <- function(..., split = FALSE, collapse = NULL) {
  bfr <- capture.output(..., split = split)
  if (!is.null(collapse)) bfr <- paste(c(bfr, ""), collapse = "\n")
  bfr
}

record_conditions <- function(expr, ..., classes = "condition", split = FALSE) {
  conditions <- list()
  withCallingHandlers(expr, condition = function(c) {
    if (inherits(c, classes)) {
      attr(c, "received") <- Sys.time()
      conditions[[length(conditions) + 1L]] <<- c
      if (!split) muffle_condition(c)
    }
  })
  conditions
}

record_relay <- function(..., all = FALSE, split = FALSE) {
  stdout <- capture_output(conditions <- record_conditions(...), split = split)
  msgs <- sapply(conditions, FUN = conditionMessage)
  res <- list(stdout = stdout, msgs = msgs)
  if (all) res$conditions <- conditions
  res
}

muffle_condition <- function(cond) {
  muffled <- FALSE
  if (inherits(cond, "message")) {
    invokeRestart("muffleMessage")
    muffled <- TRUE
  } else if (inherits(cond, "warning")) {
    invokeRestart("muffleWarning")
    muffled <- TRUE
  } else if (inherits(cond, "condition")) {
    restarts <- computeRestarts(cond)
    for (restart in restarts) {
      name <- restart$name
      if (is.null(name)) 
          next
      if (!grepl("^muffle", name)) 
          next
      invokeRestart(restart)
      muffled <- TRUE
      break
    }
  }
  invisible(muffled)
}

## Adopted from R.utils::cmsg()
console_msg <- function(..., collapse = "\n", sep = "\n", appendLF = TRUE) {
  fh <- tempfile()
  on.exit(file.remove(fh))
  cat(..., collapse = sep, sep = sep, file = fh)
  if (appendLF) 
    cat("\n", file = fh, append = TRUE)
  if (.Platform$OS.type == "windows") {
    file.show(fh, pager = "console", header = "", title = "",
              delete.file = FALSE)
  } else {
    system(sprintf("cat %s", fh))
  }
  invisible()
}
