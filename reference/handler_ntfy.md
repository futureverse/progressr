# Progression Handler: Progress Reported via the Ntfy.sh Messaging Service

A progression handler for
[`ntfy::ntfy_send()`](https://jonocarroll.github.io/ntfy/reference/ntfy_send.html)
of the ntfy package, which sends notifications via the <https://ntfy.sh>
framework.

## Usage

``` r
handler_ntfy(
  intrusiveness = getOption("progressr.intrusiveness.ntfy", 5),
  target = "gui",
  ...,
  title = "Progress update from R"
)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- title:

  title of notification. See
  <https://docs.ntfy.sh/publish/#message-title>

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the ntfy package.

## Examples

``` r
pkg <- "ntfy"
if (requireNamespace(pkg, quietly = TRUE)) {
  ## We need to specify a ntfy.sh topic that progress messages
  ## should be sent to. See help("ntfy_topic", package = "ntfy")
  ## for details
  Sys.setenv(NTFY_TOPIC = "R-my-secret-topic")

  handlers("ntfy")
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
