# Progression Handler: Progress Reported as 'beepr' Sounds (Audio)

A progression handler for
[`beepr::beep()`](https://rdrr.io/pkg/beepr/man/beep.html).

## Usage

``` r
handler_beepr(
  initiate = 2L,
  update = 10L,
  finish = 11L,
  interrupt = 9L,
  intrusiveness = getOption("progressr.intrusiveness.audio", 5),
  target = "audio",
  ...
)
```

## Arguments

- initiate, update, finish, interrupt:

  (integer) Indices of
  [`beepr::beep()`](https://rdrr.io/pkg/beepr/man/beep.html) sounds to
  play when progress starts, is updated, completes, or is interrupted.
  For silence, use `NA_integer_`.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the beepr package.

## Examples

``` r
if (requireNamespace("beepr", quietly = TRUE)) {

  handlers("beepr")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
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
#> [1] 55
```
