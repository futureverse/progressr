# Progression Handler: Progress Reported via the Operating-System Notification Framework (GUI, Text)

A progression handler for `notify()` of the notifier package.

## Usage

``` r
handler_notifier(
  intrusiveness = getOption("progressr.intrusiveness.notifier", 10),
  target = "gui",
  ...
)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the notifier package, which is only
available from <https://github.com/gaborcsardi/notifier>. This can be
installed as `remotes::install_github("gaborcsardi/notifier@62d484")`.

## Examples

``` r
pkg <- "notifier"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("notifier")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
```
