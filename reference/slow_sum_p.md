# Slowly Calculate Sum or Square Roots of Elements

Slowly Calculate Sum or Square Roots of Elements

## Usage

``` r
slow_sum_p(
  x,
  delay = getOption("progressr.demo.delay", 0.5),
  stdout = getOption("progressr.demo.stdout", FALSE),
  message = getOption("progressr.demo.message", TRUE),
  sticky = getOption("progressr.demo.sticky", TRUE),
  progress = getOption("progressr.demo.progress", TRUE)
)

slow_sum(
  x,
  delay = getOption("progressr.demo.delay", 0.5),
  stdout = FALSE,
  message = FALSE,
  sticky = FALSE,
  progress = FALSE
)

slow_sqrt_p(
  x,
  delay = getOption("progressr.demo.delay", 0.5),
  stdout = getOption("progressr.demo.stdout", FALSE),
  message = getOption("progressr.demo.message", TRUE),
  sticky = getOption("progressr.demo.sticky", TRUE),
  progress = getOption("progressr.demo.progress", TRUE)
)

slow_sqrt(
  x,
  delay = getOption("progressr.demo.delay", 0.5),
  stdout = FALSE,
  message = FALSE,
  sticky = FALSE,
  progress = FALSE
)
```

## Arguments

- x:

  Numeric vector to sum or calculate square roots for.

- delay:

  Delay in seconds after each addition/calculation.

- stdout:

  If TRUE, then a text is outputted to the standard output per element.

- message:

  If TRUE, then a message is outputted per element.

- sticky:

  If TRUE, then a "sticky" message is outputted every ten element.

- progress:

  If TRUE, then a progressor is created, otherwise a void progressor
  that does nothing is used.

## Value

The sum or square roots of all elements in `x`.

## Progress updates

These functions signal
[progression](https://progressr.futureverse.org/reference/progression.md)
conditions as they progress.
