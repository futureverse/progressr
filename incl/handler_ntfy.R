pkg <- "ntfy"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("ntfy")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
