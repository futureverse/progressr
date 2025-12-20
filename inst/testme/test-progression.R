library(progressr)

message("progression() ...")

p <- progression()
print(p)
stopifnot(inherits(p, "progression"))

message("progression() ... done")
