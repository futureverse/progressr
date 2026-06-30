# Progression Handler: Progress Reported as 'BRRR' Sounds (Audio)

A progression handler for `skrrrahh()` of the BRRR package.

## Usage

``` r
handler_brrr(
  initiate = "takeoff",
  update = "bigsean4",
  finish = "khaled3",
  interrupt = "busta",
  intrusiveness = getOption("progressr.intrusiveness.audio", 5),
  target = "audio",
  ...
)
```

## Arguments

- initiate, update, finish, interrupt:

  (integer or character) Indices or names of `skrrrahh()` sounds to play
  when progress starts, is updated, completes, or is interrupted. For
  silence, use `NA_integer_`.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the BRRR package, which is only
available from <https://github.com/brooke-watson/BRRR>. This can be
installed as `remotes::install_github("brooke-watson/BRRR")`.

## Examples

``` r
pkg <- "BRRR"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("brrr")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
```
