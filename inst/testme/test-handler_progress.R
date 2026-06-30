library(progressr)

options(progressr.clear = FALSE)

if (requireNamespace("progress", quietly = TRUE)) {
  for (type in c("default", "steps", "percent", "time")) {
    message(sprintf("handler_progress(type = '%s') ...", type))
    options(progressr.handlers = handler_progress(type = type))
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
    message(sprintf("handler_progress(type = '%s') ... done", type))
  }
}

