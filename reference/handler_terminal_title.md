# Progression Handler: Progress Reported in the Terminal Title

A progression handler that reports on progress in the title of the
terminal window or tab, e.g. `[ 42%] 21/50 | ETA 00:12 | message`. This
is useful when the terminal is in the background, or when the console is
busy with other output.

## Usage

``` r
handler_terminal_title(
  spinner = NULL,
  file = stderr(),
  intrusiveness = getOption("progressr.intrusiveness.gui", 1),
  target = "gui",
  ...
)
```

## Arguments

- spinner:

  (character vector) Symbols to cycle through on each progress update,
  including updates with `amount = 0`, which signal that the process is
  still alive. If `NULL`, no spinner is shown. The default is a set of
  Unicode braille symbols, if the current locale supports UTF-8,
  otherwise `-`, `\`, `|`, and `/`.

- file:

  (connection) A
  [base::connection](https://rdrr.io/r/base/connections.html) to where
  the escape sequences that set the terminal title should be sent.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Value

A function of class `progression_handler` that takes a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition as its first and only argument.

## Details

The terminal title is set using the xterm "OSC 0" escape sequence, which
is supported by most modern terminals, e.g. xterm, GNOME Terminal,
Konsole, macOS Terminal, iTerm2, and Windows Terminal. Inside `tmux` and
GNU `screen`, it sets the title of the pane or window, which is
displayed by the outer terminal only if the multiplexer is configured to
do so, e.g. `set-option -g set-titles on` for `tmux`.

When progress completes, or is interrupted, the terminal title is
restored using the xterm title stack. Terminals that do not support the
title stack are instead reset to an empty title, which most terminals
display as their default title.

This handler outputs nothing, if `file` is not a terminal, if the
terminal is a "dumb" terminal, or if R runs in the RStudio Console or in
Emacs. On MS Windows, it outputs only when R runs in a terminal known to
support escape sequences, e.g. Windows Terminal.

Since the terminal title does not interfere with the output in the
console, this handler can be combined with other progression handlers,
e.g. `handlers(c("txtprogressbar", "terminal_title"))`.

## Examples

``` r
handlers("terminal_title")
with_progress({ y <- slow_sum_p(1:10) })
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

## Report progress both in the console and in the terminal title
handlers(c("txtprogressbar", "terminal_title"))
with_progress({ y <- slow_sum_p(1:10) })
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
