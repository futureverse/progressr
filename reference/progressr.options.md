# Options and environment variables used by the 'progressr' packages

Below are environment variables and R options that are used by the
progressr package. Below are all R options that are currently used by
the progressr package.  
  
*WARNING: Note that the names and the default values of these options
may change in future versions of the package. Please use with care until
further notice.*

## Options for controlling progression reporting

- progressr.handlers::

  (function or list of functions) Zero or more progression handlers that
  will report on any progression updates. If empty list, progress
  updates are ignored. If NULL, the default (`handler_txtprogressbar`)
  progression handlers is used. The recommended way to set this option
  is via
  [`handlers()`](https://progressr.futureverse.org/reference/handlers.md).
  (Default: NULL)

## Options for controlling progression handlers

- progressr.clear::

  (logical) If TRUE, any output, typically visual, produced by a
  reporter will be cleared/removed upon completion, if possible.
  (Default: TRUE)

- progressr.enable::

  (logical) If FALSE, then progress is not reported. (Default: TRUE in
  interactive mode, otherwise FALSE)

- progressr.enable_after::

  (numeric) Delay (in seconds) before progression updates are reported.
  (Default: `0.0`)

- progressr.times::

  (numeric) The maximum number of times a handler should report
  progression updates. If zero, then progress is not reported. (Default:
  `+Inf`)

- progressr.interval::

  (numeric) The minimum time (in seconds) between successive progression
  updates from this handler. (Default: `0.0`)

- progressr.intrusiveness::

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user. This multiplicative scalar applies to the
  *interval* and *times* parameters. (Default: `1.0`)  

  progressr.intrusiveness.audio:

  :   (numeric) intrusiveness for auditory progress handlers (Default:
      `5.0`)

  progressr.intrusiveness.file:

  :   (numeric) intrusiveness for file-based progress handlers (Default:
      `5.0`)

  progressr.intrusiveness.gui:

  :   (numeric) intrusiveness for graphical-user-interface progress
      handlers (Default: `1.0`)

  progressr.intrusiveness.notifier:

  :   (numeric) intrusiveness for progress handlers that creates
      notifications (Default: `10.0`)

  progressr.intrusiveness.terminal:

  :   (numeric) intrusiveness for progress handlers that outputs to the
      terminal (Default: `1.0`)

  progressr.intrusiveness.debug:

  :   (numeric) intrusiveness for "debug" progress handlers (Default:
      `0.0`)

## Options for controlling how standard output and conditions are relayed

- progressr.delay_conditions::

  (character vector) condition classes to be captured and relayed at the
  end after any captured standard output is relayed. (Default:
  `c("condition")`)

- progressr.delay_stdout::

  (logical) If TRUE, standard output is captured and relayed at the end
  just before any captured conditions are relayed. (Default: TRUE)

## Options for controlling interrupts

- progressr.interrupts::

  (logical) Controls whether interrupts should be detected or not. If
  FALSE, then interrupts are not detected and progress information is
  generated. (Default: `TRUE`)

- progressr.delay_stdout::

  (logical) If TRUE, standard output is captured and relayed at the end
  just before any captured conditions are relayed. (Default: TRUE)

## Options for debugging progression updates

- progressr.debug::

  (logical) If TRUE, extensive debug messages are generated. (Default:
  FALSE)

## Options for progressr examples and demos

- progressr.demo.delay::

  (numeric) Delay (in seconds) between each iteration of
  [`slow_sum()`](https://progressr.futureverse.org/reference/slow_sum.md).
  (Default: `1.0`)

## Environment variables that set R options

Some of the above R progressr.\* options can be set by corresponding
environment variable `R_PROGRESSR_*` *when the progressr package is
loaded*. For example, if `R_PROGRESSR_ENABLE = "true"`, then option
progressr.enable is set to `TRUE` (logical). For example, if
`R_PROGRESSR_ENABLE_AFTER = "2.0"`, then option progressr.enable_after
is set to `2.0` (numeric).

## See also

To set R options when R starts (even before the progressr package is
loaded), see the [Startup](https://rdrr.io/r/base/Startup.html) help
page. The [startup](https://cran.r-project.org/package=startup) package
provides a friendly mechanism for configuring R at startup.
