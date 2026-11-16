handlers("terminal_title")
with_progress({ y <- slow_sum_p(1:10) })
print(y)

## Report progress both in the console and in the terminal title
handlers(c("txtprogressbar", "terminal_title"))
with_progress({ y <- slow_sum_p(1:10) })
print(y)
