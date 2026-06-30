library(progressr)

if (requireNamespace("pbmcapply", quietly = TRUE)) {
  handlers("pbmcapply")
  for (x in list(integer(0), 1:10, 1L)) {
    message("length(x): ", length(x))
    with_progress({ y <- slow_sum_p(x) })
    print(y)
  }
}

