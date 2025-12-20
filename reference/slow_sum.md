# Slowly Calculate Sum of Elements

Slowly Calculate Sum of Elements

## Usage

``` r
slow_sum(
  x,
  delay = getOption("progressr.demo.delay", 1),
  stdout = FALSE,
  message = TRUE,
  sticky = TRUE
)
```

## Arguments

- x:

  Numeric vector to sum

- delay:

  Delay in seconds after each addition.

- stdout:

  If TRUE, then a text is outputted to the standard output per element.

- message:

  If TRUE, then a message is outputted per element.

- sticky:

  If TRUE, then a "sticky" message is outputted every ten element.

## Value

The sum of all elements in `x`.

## Progress updates

This function signals
[progression](https://progressr.futureverse.org/reference/progression.md)
conditions as it progresses.
