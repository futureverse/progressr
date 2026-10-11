# Progression Handler: Progress Reported via a User-Defined Hook Function

A progression handler that calls a custom hook function every time this
handler receives a progression update, e.g. to forward progress
information to logging, GUIs, or other external systems not supported by
progressr.

## Usage

``` r
handler_callback(
  fcn = NULL,
  intrusiveness = getOption("progressr.intrusiveness.callback", 1),
  target = "callback",
  ...
)
```

## Arguments

- fcn:

  (function) A hook function that is called whenever this handler
  reports on an `"initiate"`, `"update"`, or `"finish"` event. It is
  called as `fcn(type, step, max_steps, message, amount)`, where `type`
  (character string) is one of `"initiate"`, `"update"`, or `"finish"`,
  `step` (integer) is the number of steps completed so far, `max_steps`
  (integer) is the total number of steps, `message` (character string)
  is the latest progress message, and `amount` (numeric) is the
  increment in `step` since the previous call. The function should
  accept `...` to remain forward compatible with future arguments. Any
  value returned by `fcn` is ignored. If `NULL` (default), no hook
  function is called, i.e. this handler produces no output.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Value

A function of class `progression_handler` that takes a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition as its first and only argument.

## Examples

``` r
handlers(handler_callback(fcn = function(type, step, max_steps, message, amount, ...) {
  message(sprintf("[%s] step %d/%d (%+g): %s", type, step, max_steps, amount, message))
}))
with_progress({ y <- slow_sum_p(1:10) })
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 4
#> M: Added value 5
#> M: Added value 6
#> M: Added value 7
#> M: Added value 8
#> M: Added value 9
#> M: Added value 10
print(y)
#> [1] 55
```
