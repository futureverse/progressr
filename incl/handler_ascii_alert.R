handlers("ascii_alert")
with_progress({ y <- slow_sum_p(1:10) })
print(y)
