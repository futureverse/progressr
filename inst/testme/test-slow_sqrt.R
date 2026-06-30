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

message("slow_sqrt() ... done")
