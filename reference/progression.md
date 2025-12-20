# A Progression Condition

A progression condition represents a progress in an R program.

## Usage

``` r
progression(
  message = character(0L),
  amount = 1,
  step = NULL,
  time = progression_time,
  ...,
  type = "update",
  class = NULL,
  progressor_uuid = NULL,
  progression_index = NULL,
  progression_time = Sys.time(),
  call = NULL,
  calls = sys.calls(),
  owner_session_uuid = NULL
)
```

## Arguments

- message:

  (character vector or a function) If a character vector, then it is
  pasted together into a single string using an empty separator. If a
  function, then the message is constructed by `conditionMessage(p)`
  calling this function with the progression condition `p` itself as the
  first argument.

- amount:

  (numeric) The total amount of progress made.

- step:

  (numeric) The step completed. If specified, `amount` is ignored.
  *WARNING: Argument `step` should only be used when in full control of
  the order when this progression condition is signaled.* For example,
  it must not be signaled as one of many parallel progress updates
  signaled concurrently, because then we cannot guarantee the order
  these progressions arrive.

- time:

  (POSIXct) A timestamp.

- type:

  Type of progression made.

- class:

  (character) Zero or more class names to prepend.

- progressor_uuid:

  (character string) A character string that is unique for the current
  progressor and the current R session.

- progression_index:

  (integer) A non-negative integer that is incremented by one for each
  progression condition created.

- progression_time:

  (POSIXct or character string) A timestamp specifying when the
  progression condition was created.

- call:

  (expression) A call expression.

- calls:

  (pairlist) The calls that lead up to this progression update.

- owner_session_uuid:

  (character string) A character string that is unique for the R session
  where the progressor was created.

- ...:

  Additional named elements.

## Value

A [base::condition](https://rdrr.io/r/base/conditions.html) of class
`progression`.

## See also

To signal a progression condition, use
[`base::signalCondition()`](https://rdrr.io/r/base/conditions.html).
