pkg <- "notifier"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("notifier")
  with_progress({ y <- slow_sum_p(1:10) })
  print(y)
  
}
