library(progressr)

message("progression() ...")

p <- progression()
print(p)
stopifnot(inherits(p, "progression"))

message("- conditionMessage() with a function 'message' ...")
p2 <- progression(message = function(c) "Dynamically generated message")
stopifnot(identical(conditionMessage(p2), "Dynamically generated message"))
message("- conditionMessage() with a function 'message' ... done")

message("- conditionMessage() with a character vector 'message' ...")
p3 <- progression(message = c("a", "b", "c"))
stopifnot(identical(conditionMessage(p3), "abc"))
message("- conditionMessage() with a character vector 'message' ... done")

message("progression() ... done")
