library(progressr)

options(progressr.debug = FALSE)

message("*** with_progress() - partial-line stdout buffering ...")

progressr::handlers("txtprogressbar")

output <- local({
  options(width = 10L)
  bfr <- character(0L)
  con <- textConnection("bfr", open = "w+", local = TRUE)
  on.exit(close(con))
  utils::capture.output({
    utils::capture.output({
      with_progress({
        p <- progressor(1)
        cat("abc\n")
        cat("DEF")
        p()
        cat("ghi\n")
      })
    }, file = con, type = "output")
  }, file = con, type = "message")
  textConnectionValue(con)
})

## Render combined stdout + stderr output
writeLines(output)

print(output)

## Assert that all stdout is in there and at the expected lines
stopifnot(
  grep("\babc\b", output) == 1L,
  grep("\bDEFghi\b", output) == 2L
)

## Emulate what is rendered with CR-wiping progress bar
visual <- strsplit(output, split = "\r")
visual <- vapply(visual, FUN = tail, n = 1L, FUN.VALUE = NA_character_)
print(visual)
stopifnot(
  length(visual) == 2L,
  visual[1] == "abc",
  visual[2] == "DEFghi"
)

message("*** with_progress() - partial-line stdout buffering ... DONE")
