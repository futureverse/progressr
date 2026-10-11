handlers(handler_callback(fcn = function(type, step, max_steps, message, amount, ...) {
  message(sprintf("[%s] step %d/%d (%+g): %s", type, step, max_steps, amount, message))
}))
with_progress({ y <- slow_sum_p(1:10) })
print(y)
