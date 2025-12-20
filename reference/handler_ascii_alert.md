# Progression Handler: Progress Reported as ASCII BEL Symbols (Audio or Blink) in the Terminal

A progression handler based on `cat("\a", file=stderr())`.

## Usage

``` r
handler_ascii_alert(
  symbol = "\a",
  file = stderr(),
  intrusiveness = getOption("progressr.intrusiveness.audio", 5),
  target = c("terminal", "audio"),
  ...
)
```

## Arguments

- symbol:

  (character string) The character symbol to be outputted, which by
  default is the ASCII BEL character (`'\a'` = `'\007'`) character.

- file:

  (connection) A
  [base::connection](https://rdrr.io/r/base/connections.html) to where
  output should be sent.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Examples

``` r
handlers("ascii_alert")
with_progress({ y <- slow_sum(1:10) })
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
