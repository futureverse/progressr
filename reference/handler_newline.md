# Progression Handler: Progress Reported as a New Line (Text) in the Terminal

Progression Handler: Progress Reported as a New Line (Text) in the
Terminal

## Usage

``` r
handler_newline(
  symbol = "\n",
  file = stderr(),
  intrusiveness = getOption("progressr.intrusiveness.debug", 0),
  target = "terminal",
  ...
)
```

## Arguments

- symbol:

  (character string) The character symbol to be outputted, which by
  default is the ASCII NL character (`'\n'` = `'\013'`) character.

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
