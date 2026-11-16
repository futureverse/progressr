library(progressr)
options(progressr.enable = TRUE)

message("handler_terminal_title ...")

message("- internal helpers ...")
terminal_title <- progressr:::terminal_title
format_hms <- progressr:::format_hms
osc_title <- progressr:::osc_title

stopifnot(
  identical(format_hms(0), "00:00"),
  identical(format_hms(12.4), "00:12"),
  identical(format_hms(3599), "59:59"),
  identical(format_hms(3600 + 62), "1:01:02")
)

stopifnot(identical(osc_title("abc"), "\033]0;abc\007"))

title <- terminal_title(step = 21L, max_steps = 50L)
print(title)
stopifnot(identical(title, "[ 42%] 21/50"))

title <- terminal_title(step = 21L, max_steps = 50L, elapsed = 21, message = "hello", spin = "|")
print(title)
stopifnot(identical(title, "| [ 42%] 21/50 | ETA 00:29 | hello"))

## No ETA when done or when not yet started
title <- terminal_title(step = 0L, max_steps = 50L, elapsed = 1)
stopifnot(!grepl("ETA", title))
title <- terminal_title(step = 50L, max_steps = 50L, elapsed = 1)
stopifnot(identical(title, "[100%] 50/50"))
title <- terminal_title(step = 0L, max_steps = 0L)
stopifnot(identical(title, "[100%] 0/0"))

## Control characters and ANSI escape sequences are dropped from messages
title <- terminal_title(step = 1L, max_steps = 2L, message = "a\nb\033[31mc\033[0m\007")
print(title)
stopifnot(!grepl("[[:cntrl:]]", title), grepl("| a bc$", title))

## Not a terminal
con <- rawConnection(raw(0L), open = "w")
stopifnot(!progressr:::terminal_title_supported(con))
close(con)


message("- non-terminal output (no-op) ...")
file <- tempfile()
con <- file(file, open = "w")
h <- handler_terminal_title(file = con, enable = TRUE)
stopifnot(inherits(h, "terminal_title_progression_handler"))
with_progress({
  p <- progressor(3)
  for (kk in 1:3) p(amount = 0)
  for (kk in 1:3) p(sprintf("step %d", kk))
}, handlers = h)
close(con)
stopifnot(file.size(file) == 0L)
file.remove(file)


message("- terminal output ...")
file <- tempfile()
con <- file(file, open = "wb")
h <- handler_terminal_title(spinner = c("-", "+"), file = con, enable = TRUE, interval = 0)
## Pretend 'con' is a terminal
env <- parent.env(environment(environment(h)$reporter$update))
assign("supported", TRUE, envir = env)
with_progress({
  p <- progressor(3)
  p(amount = 0)
  for (kk in 1:3) p(sprintf("step %d", kk))
}, handlers = h)
close(con)
out <- readChar(file, nchars = file.size(file), useBytes = TRUE)
file.remove(file)
print(out)
stopifnot(
  ## Title stack is pushed once and popped once
  lengths(regmatches(out, gregexpr("\033[22;0t", out, fixed = TRUE))) == 1L,
  lengths(regmatches(out, gregexpr("\033[23;0t", out, fixed = TRUE))) == 1L,
  grepl("\033]0;- [ 33%] 1/3", out, fixed = TRUE),
  grepl("| step 1\007", out, fixed = TRUE),
  ## The title is reset at the very end
  endsWith(out, paste0(osc_title(""), "\033[23;0t"))
)


message("- interrupt and shutdown ...")
file <- tempfile()
con <- file(file, open = "wb")
h <- handler_terminal_title(file = con, enable = TRUE)
env <- parent.env(environment(environment(h)$reporter$update))
assign("supported", TRUE, envir = env)
h(progression(type = "initiate", steps = 5, auto_finish = TRUE, progressor_uuid = "uuid-1", progression_index = 1L))
h(progression(type = "update", amount = 1, progressor_uuid = "uuid-1", progression_index = 2L))
h(progressr:::control_progression("hide"))
h(progressr:::control_progression("unhide"))
h(progressr:::control_progression("interrupt", message = "Interrupt message"))
h(progressr:::control_progression("shutdown"))
h(progressr:::control_progression("reset"))
close(con)
out <- readChar(file, nchars = file.size(file), useBytes = TRUE)
file.remove(file)
print(out)
## Each push onto the title stack is followed by a pop
npush <- lengths(regmatches(out, gregexpr("\033[22;0t", out, fixed = TRUE)))
npop <- lengths(regmatches(out, gregexpr("\033[23;0t", out, fixed = TRUE)))
stopifnot(npush >= 1L, npush == npop, endsWith(out, paste0(osc_title(""), "\033[23;0t")))

message("handler_terminal_title ... done")
