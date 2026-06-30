# Slowly Calculate Square Roots of Elements

Slowly Calculate Square Roots of Elements

## Usage

``` r
slow_sqrt(
  x,
  delay = getOption("progressr.demo.delay", 1),
  stdout = getOption("progressr.demo.stdout", FALSE),
  message = getOption("progressr.demo.message", TRUE),
  sticky = getOption("progressr.demo.sticky", TRUE),
  progress = getOption("progressr.demo.progress", TRUE)
)
```

## Arguments

- x:

  Numeric vector to calculate square roots for.

- delay:

  Delay in seconds after each calculation.

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

The square roots of all elements in `x` as a numeric vector.

## Progress updates

This function signals
[progression](https://progressr.futureverse.org/reference/progression.md)
conditions as it progresses.
