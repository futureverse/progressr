# Progression Handler: Progress Reported in the RStudio Console

Progression Handler: Progress Reported in the RStudio Console

## Usage

``` r
handler_rstudio(
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "gui",
  title = function() format(Sys.time(), "Console %X"),
  ...
)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- title:

  (character or a function) The "name" of the progressor, which is
  displayed in front of the progress bar. If a function, then the name
  is created dynamically by calling the function when the progressor is
  created.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler works only in the RStudio Console.

## Use this progression handler by default

To use this handler by default whenever using the RStudio Console, add
the following to your `~/.Rprofile` startup file:

    if (requireNamespace("progressr", quietly = TRUE)) {
      if (Sys.getenv("RSTUDIO") == "1" && !nzchar(Sys.getenv("RSTUDIO_TERM"))) {
        options(progressr.handlers = progressr::handler_rstudio)
      }
    }

## Examples

``` r
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {

  handlers("rstudio")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
```
