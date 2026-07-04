if (capabilities("tcltk") && requireNamespace("tcltk", quietly = TRUE)) {

  handlers("tkprogressbar")
  with_progress({ y <- slow_sum_p(1:10) })
  print(y)
  
}
