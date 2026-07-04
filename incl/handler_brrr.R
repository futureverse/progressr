pkg <- "BRRR"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("brrr")
  with_progress({ y <- slow_sum_p(1:10) })
  print(y)
  
}
