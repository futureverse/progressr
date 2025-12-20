# Creates a Progression Calling Handler

A progression calling handler is a function that takes a
[base::condition](https://rdrr.io/r/base/conditions.html) as its first
argument and that can be use together with
[`base::withCallingHandlers()`](https://rdrr.io/r/base/conditions.html).
This function helps creating such progression calling handler functions.

## Usage

``` r
make_progression_handler(
  name,
  reporter = list(),
  handler = NULL,
  enable = getOption("progressr.enable", interactive()),
  enable_after = getOption("progressr.enable_after", 0),
  times = getOption("progressr.times", +Inf),
  interval = getOption("progressr.interval", 0),
  intrusiveness = 1,
  clear = getOption("progressr.clear", TRUE),
  target = "terminal",
  ...
)
```

## Arguments

- name:

  (character) Name of progression handler.

- reporter:

  (list) A named list of reporter functions.

- handler:

  (function) Function take a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  condition as the first argument.

- enable:

  (logical) If FALSE, then progress is not reported.

- enable_after:

  (numeric) Delay (in seconds) before progression updates are reported.

- times:

  (numeric) The maximum number of times this handler should report
  progression updates. If zero, then progress is not reported.

- interval:

  (numeric) The minimum time (in seconds) between successive progression
  updates from this handler.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- clear:

  (logical) If TRUE, any output, typically visual, produced by a
  reporter will be cleared/removed upon completion, if possible.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Not used.

## Value

A function of class `progression_handler` that takes a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition as its first and only argument.

## Details

The inner details of progression handlers and how to use this function
are still to be documented. Until then, see the source code of existing
handlers for how it is used, e.g.
[`progressr::handler_txtprogressbar`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md).
Please use with care as things might change.

## Reporter functions

The `reporter` argument should be a named list of zero or more of the
following functions:

- `initiate`

- `update`

- `finish`

These functions are called whenever a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition of type `"initiate"`, `"update"`, or `"finish"` are received,
but only if the condition is for the progression that is currently
handled. These functions are called with the following arguments (in
order):

- `config` - a named list of the configuration of the progression
  handler: `max_steps` (integer), `interval` (numeric), `enable_after`
  (numeric), `auto_finish` (logical), `clear` (logical), `target`
  (character vector)

- `state` - a named list of the current progress state after accounting
  for the most recent `progression` condition: `step` (integer),
  `message` (character), `delta` (integer), `enabled` (logical),
  `timestamps` (POSIXct vector)

- `progression` - a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  condition

- ... - not used (reserved for future needs)

In addition to the above functions, the following functions:

- `hide`

- `unhide`

- `reset`

- `interrupt`

are called whenever the handler "should" hide or unhide the rendered
progress, or reset it, or when an interrupt is detected. In these cases,
the `progression` argument is of class `control_progression`.

## See also

[`base::withCallingHandlers()`](https://rdrr.io/r/base/conditions.html).

## Examples

``` r
## Create a progression handler that reports on the current progress
## step, the relative change, and the current progress message. This
## is only reported on positive progressions updated
my_handler <- make_progression_handler(name = "my", reporter = list(
  update = function(config, state, progression, ...) {
    if (progression$amount > 0) {
      message(sprintf("step = %d (+%g): message = %s",
                      state$step,
                      progression$amount,
                      sQuote(state$message)))
    }
  }
))

handlers(my_handler)

with_progress({
  y <- slow_sum(1:5)
})
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 4
#> M: Added value 5
```
