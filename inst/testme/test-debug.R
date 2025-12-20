library(progressr)

message("with_progress() - progressr.debug = TRUE ...")

options(progressr.debug = TRUE)

with_progress({
  y <- slow_sum(1:10)
})


with_progress({
  p <- progressor(steps = 1 + 2 + 1)
  relay_progress <- progress_aggregator(p)
  cond <- p()
  relay_progress(slow_sum(1:2))
  p(type = "finish")
  p() ## one too many - will be ignored
})


message("with_progress() - progressr.debug = TRUE ... done")

