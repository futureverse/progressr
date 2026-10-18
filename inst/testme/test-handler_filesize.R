library(progressr)

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

message("- enable_after delays reporting (initiate/update/finish early returns) ...")

file <- tempfile(fileext = ".progress")
## interval = 0 is required
h <- handler_filesize(file = file, enable_after = 100.0, clear = TRUE, interval = 0)
h(progression(type = "initiate", steps = 3L, auto_finish = TRUE, progressor_uuid = "uuid-fs-1", progression_index = 1L))
h(progression(type = "update", amount = 1, progressor_uuid = "uuid-fs-1", progression_index = 2L))
h(progressr:::control_progression("interrupt", message = "Interrupted"))
h(progressr:::control_progression("shutdown"))
if (file.exists(file)) file.remove(file)

message("- enable_after delays reporting (initiate/update/finish early returns) ... done")

message("- interrupt() and finish(clear = TRUE) removes the file ...")

file <- tempfile(fileext = ".progress")
h <- handler_filesize(file = file, clear = TRUE)
h(progression(type = "initiate", steps = 3L, auto_finish = TRUE, progressor_uuid = "uuid-fs-2", progression_index = 1L))
h(progression(type = "update", amount = 1, progressor_uuid = "uuid-fs-2", progression_index = 2L))
stopifnot(file.exists(file))
h(progressr:::control_progression("interrupt", message = "Interrupted"))
h(progressr:::control_progression("shutdown"))
stopifnot(!file.exists(file))

message("- interrupt() and finish(clear = TRUE) removes the file ... done")


message("handler_filesize() ... done")

