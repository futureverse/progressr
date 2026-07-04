if (requireNamespace("cli", quietly = TRUE)) {
  library(progressr)
  options(progressr.clear = FALSE)

  message("handler_cli() ...")

  options(progressr.handlers = handler_cli)
  
  # Test 'type' argument defaults for format and format_done
  for (type in c("default", "steps", "percent", "time")) {
    h <- handler_cli(type = type)
    env <- environment(environment(h)$reporter$initiate)
    backend_args <- parent.env(env)$backend_args
    if (type == "default") {
      stopifnot(is.null(backend_args$format), is.null(backend_args$format_done))
    } else if (type == "steps") {
      stopifnot(
        backend_args$format == "{cli::pb_spin} {cli::pb_bar} {cli::pb_current}/{cli::pb_total} {cli::pb_status}",
        backend_args$format_done == "{cli::pb_bar} {cli::pb_current}/{cli::pb_total} {cli::pb_status}"
      )
    } else if (type == "percent") {
      stopifnot(
        backend_args$format == "{cli::pb_spin} {cli::pb_bar} {cli::pb_percent} {cli::pb_status}",
        backend_args$format_done == "{cli::pb_bar} {cli::pb_percent} {cli::pb_status}"
      )
    } else if (type == "time") {
      stopifnot(
        backend_args$format == "[{cli::pb_elapsed}] {cli::pb_spin} {cli::pb_bar} {cli::pb_percent} [{cli::pb_current}/{cli::pb_total}] (ETA: {cli::pb_eta}) {cli::pb_status}",
        backend_args$format_done == "[{cli::pb_elapsed}] {cli::pb_bar} {cli::pb_percent} [{cli::pb_current}/{cli::pb_total}] {cli::pb_status}"
      )
    }
  }

  for (x in list(integer(0), 1:10, 1L)) {
    message("length(x): ", length(x))
    with_progress({
      progress <- progressor(along = x)
      for (ii in x) {
        Sys.sleep(getOption("progressr.demo.delay", 0.1))
        progress(message = sprintf("(%s)", paste(letters[1:ii], collapse="")))
      }
    })
  }

  message("handler_cli() ... done")
} ## if (requireNamespace("cli", ...))
