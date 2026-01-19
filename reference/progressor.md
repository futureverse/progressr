# Create a Progressor Function that Signals Progress Updates

Create a Progressor Function that Signals Progress Updates

## Usage

``` r
progressor(
  steps = length(along),
  along = NULL,
  offset = 0L,
  scale = 1L,
  transform = function(steps) scale * steps + offset,
  message = character(0L),
  label = NA_character_,
  trace = FALSE,
  initiate = TRUE,
  finalize = FALSE,
  auto_finish = TRUE,
  on_exit = !identical(envir, globalenv()),
  enable = getOption("progressr.enable", TRUE),
  envir = parent.frame()
)
```

## Arguments

- steps:

  (integer) Number of progressing steps.

- along:

  (vector; alternative) Alternative that sets `steps = length(along)`.

- offset, scale:

  (integer; optional) scale and offset applying the transform
  `steps <- scale * steps + offset`.

- transform:

  (function; optional) A function that takes the effective number of
  `steps` as input and returns another finite and non-negative number of
  steps.

- message:

  (character vector or a function) If a character vector, then it is
  pasted together into a single string using an empty separator. If a
  function, then the message is constructed by `conditionMessage(p)`
  calling this function with the progression condition `p` itself as the
  first argument.

- label:

  (character) A label.

- trace:

  (logical) If TRUE, then the call stack is recorded, otherwise not.

- initiate:

  (logical) If TRUE, the progressor will signal a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  'initiate' condition when created.

- finalize:

  (logical) If TRUE, the progressor signals a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  'shutdown' condition when finalized by the garbage collector.

- auto_finish:

  (logical) If TRUE, then the progressor will signal a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  'finish' condition as soon as the last step has been reached.

- on_exit, envir:

  (logical) If TRUE, then the created progressor will signal a
  [progression](https://progressr.futureverse.org/reference/progression.md)
  'finish' condition when the calling frame exits. This is ignored if
  the calling frame (`envir`) is the global environment.

- enable:

  (logical) If TRUE,
  [progression](https://progressr.futureverse.org/reference/progression.md)
  conditions are signaled when calling the progressor function created
  by this function. If FALSE, no
  [progression](https://progressr.futureverse.org/reference/progression.md)
  conditions is signaled because the progressor function is an empty
  function that does nothing.

## Value

A function of class `progressor`.

## Details

A `progressor` function can only be created inside a local environment,
e.g. inside a function, within a
[`local()`](https://rdrr.io/r/base/eval.html) call, or within a
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
call. Notably, it *cannot* be created at the top level, e.g. immediately
at the R prompt or outside a local environment in an R script. If
attempted, an informative error message is produced, e.g.

    > p <- progressr::progressor(100)
    Error in progressr::progressor(100) :
      A progressor must not be created in the global environment unless
    wrapped in a with_progress() or without_progress() call. Alternatively,
    create it inside a function or in a local() environment to make sure
    there is a finite life span of the progressor
