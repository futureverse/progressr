library(progressr)

options(progressr.demo.delay = 0.001)
options(progressr.interval = 0.0)
options(progressr.clear = FALSE)


message("slow_sum_p() ...")

x <- 1:5
truth <- sum(x)

res <- slow_sum_p(x)
stopifnot(identical(res, truth))

res <- with_progress({
  slow_sum_p(x)
})
stopifnot(identical(res, truth))

message("slow_sum_p() ... done")


message("slow_sum() ...")

x <- 1:5
truth <- sum(x)

# slow_sum should not produce any output or messages or progress updates by default
out <- capture.output({
  msgs <- list()
  progressions <- list()
  withCallingHandlers({
    res <- slow_sum(x)
  }, message = function(m) {
    msgs[[length(msgs) + 1L]] <<- m$message
  }, progression = function(p) {
    progressions[[length(progressions) + 1L]] <<- p
  })
})
stopifnot(identical(res, truth))
stopifnot(length(out) == 0L)
stopifnot(length(msgs) == 0L)
stopifnot(length(progressions) == 0L)

# check that we can enable options/arguments on slow_sum
out <- capture.output({
  res <- slow_sum(1:2, stdout = TRUE)
})
stopifnot(any(grepl("O: Element", out)))

message("slow_sum() ... done")


message("slow_sqrt_p() ...")

x <- c(1, 4, 9, 16, 25)
truth <- sqrt(x)

res <- slow_sqrt_p(x)
stopifnot(identical(res, truth))

res <- with_progress({
  slow_sqrt_p(x)
})
stopifnot(identical(res, truth))

## Test progressr.demo.stdout, progressr.demo.message options
# 1. Test progressr.demo.stdout
options(progressr.demo.stdout = TRUE)
out <- capture.output({
  res <- slow_sqrt_p(1:2)
})
stopifnot(any(grepl("O: Element", out)))

options(progressr.demo.stdout = FALSE)
out <- capture.output({
  res <- slow_sqrt_p(1:2)
})
stopifnot(!any(grepl("O: Element", out)))
options(progressr.demo.stdout = NULL)

# 2. Test progressr.demo.message
options(progressr.demo.message = FALSE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) == 0L)

options(progressr.demo.message = TRUE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) > 0L)
stopifnot(any(grepl("M: Calculated value", unlist(msgs))))
options(progressr.demo.message = NULL)

# 3. Test explicit arguments override options
options(progressr.demo.stdout = TRUE)
out <- capture.output({
  res <- slow_sqrt_p(1:2, stdout = FALSE)
})
stopifnot(!any(grepl("O: Element", out)))
options(progressr.demo.stdout = NULL)

options(progressr.demo.message = FALSE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2, message = TRUE)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) > 0L)
options(progressr.demo.message = NULL)

# 4. Test progressr.demo.progress option and parameter
progressions <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2, progress = FALSE)
}, progression = function(p) {
  progressions[[length(progressions) + 1L]] <<- p
})
stopifnot(length(progressions) == 0L)

progressions <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2, progress = TRUE)
}, progression = function(p) {
  progressions[[length(progressions) + 1L]] <<- p
})
stopifnot(length(progressions) > 0L)

# Test option progressr.demo.progress
options(progressr.demo.progress = FALSE)
progressions <- list()
withCallingHandlers({
  res <- slow_sqrt_p(1:2)
}, progression = function(p) {
  progressions[[length(progressions) + 1L]] <<- p
})
stopifnot(length(progressions) == 0L)
options(progressr.demo.progress = NULL)

message("slow_sqrt_p() ... done")


message("slow_sqrt() ...")

x <- c(1, 4, 9, 16, 25)
truth <- sqrt(x)

# slow_sqrt should not produce any output or messages or progress updates by default
out <- capture.output({
  msgs <- list()
  progressions <- list()
  withCallingHandlers({
    res <- slow_sqrt(x)
  }, message = function(m) {
    msgs[[length(msgs) + 1L]] <<- m$message
  }, progression = function(p) {
    progressions[[length(progressions) + 1L]] <<- p
  })
})
stopifnot(identical(res, truth))
stopifnot(length(out) == 0L)
stopifnot(length(msgs) == 0L)
stopifnot(length(progressions) == 0L)

# check that we can enable options/arguments on slow_sqrt
out <- capture.output({
  res <- slow_sqrt(1:2, stdout = TRUE)
})
stopifnot(any(grepl("O: Element", out)))

message("slow_sqrt() ... done")
