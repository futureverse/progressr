# Progression Handler: No Progress Report

Progression Handler: No Progress Report

## Usage

``` r
handler_void(intrusiveness = 0, target = "void", enable = FALSE, ...)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- enable:

  (logical) If FALSE, then progress is not reported.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Details

This progression handler gives not output - it is invisible and silent.

## Examples

``` r
if (FALSE) { # \dontrun{
handlers(handler_void())
with_progress(y <- slow_sum(1:100))
print(y)
} # }
```
