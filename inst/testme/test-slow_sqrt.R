library(progressr)

options(progressr.demo.delay = 0.001)
options(progressr.interval = 0.0)
options(progressr.clear = FALSE)

message("slow_sqrt() ...")

x <- c(1, 4, 9, 16, 25)
truth <- sqrt(x)

res <- slow_sqrt(x)
stopifnot(identical(res, truth))

res <- with_progress({
  slow_sqrt(x)
})
stopifnot(identical(res, truth))

## Test progressr.demo.stdout, progressr.demo.message options
# 1. Test progressr.demo.stdout
options(progressr.demo.stdout = TRUE)
out <- capture.output({
  res <- slow_sqrt(1:2)
})
stopifnot(any(grepl("O: Element", out)))

options(progressr.demo.stdout = FALSE)
out <- capture.output({
  res <- slow_sqrt(1:2)
})
stopifnot(!any(grepl("O: Element", out)))
options(progressr.demo.stdout = NULL)

# 2. Test progressr.demo.message
options(progressr.demo.message = FALSE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt(1:2)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) == 0L)

options(progressr.demo.message = TRUE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt(1:2)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) > 0L)
stopifnot(any(grepl("M: Calculated value", unlist(msgs))))
options(progressr.demo.message = NULL)

# 3. Test explicit arguments override options
options(progressr.demo.stdout = TRUE)
out <- capture.output({
  res <- slow_sqrt(1:2, stdout = FALSE)
})
stopifnot(!any(grepl("O: Element", out)))
options(progressr.demo.stdout = NULL)

options(progressr.demo.message = FALSE)
msgs <- list()
withCallingHandlers({
  res <- slow_sqrt(1:2, message = TRUE)
}, message = function(m) {
  msgs[[length(msgs) + 1L]] <<- m$message
})
stopifnot(length(msgs) > 0L)
options(progressr.demo.message = NULL)

message("slow_sqrt() ... done")
