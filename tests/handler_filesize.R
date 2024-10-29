source("incl/start.R")

options(progressr.clear = FALSE)

options(progressr.handlers = handler_filesize)

message("handler_filesize() ...")

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

message("handler_filesize() ... done")

source("incl/end.R")
