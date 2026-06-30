## The slow_sum_p() example function
slow_sum_p <- progressr::slow_sum_p
print(slow_sum_p)

x <- 1:10

## Without progress updates
y <- slow_sum_p(x)


## Progress reported via txtProgressBar (default)
handlers("txtprogressbar")  ## default
with_progress({
  y <- slow_sum_p(x)
})

## Progress reported via tcltk::tkProgressBar
if (capabilities("tcltk") && requireNamespace("tcltk", quietly = TRUE)) {
  handlers("tkprogressbar")
  with_progress({
    y <- slow_sum_p(x)
  })
}

## Progress reported via progress::progress_bar)
if (requireNamespace("progress", quietly = TRUE)) {
  handlers("progress")
  with_progress({
    y <- slow_sum_p(x)
  })
}

## Progress reported via txtProgressBar and beepr::beep
if (requireNamespace("beepr", quietly = TRUE)) {
  handlers("beepr", "txtprogressbar")
  with_progress({
    y <- slow_sum_p(x)
  })
}

## Progress reported via customized utils::txtProgressBar and beepr::beep,
## if available.
handlers(handler_txtprogressbar(style = 3L))
if (requireNamespace("beepr", quietly = TRUE)) {
  handlers("beepr", append = TRUE)
}

with_progress({
  y <- slow_sum_p(1:30)
})
