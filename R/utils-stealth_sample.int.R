## A version of base::sample.int() that does not change .Random.seed
stealth_sample.int <- function(...) {
  oseed <- .GlobalEnv$.Random.seed
  on.exit({
    if (is.null(oseed)) {
      rm(list = ".Random.seed", envir = .GlobalEnv, inherits = FALSE)
    } else {
      .GlobalEnv$.Random.seed <- oseed
    }
  })
  suppressWarnings(sample.int(...))
}
