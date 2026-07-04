library(progressr)

message("*** toc/tic ...")

tic <- progressr:::tic
toc <- progressr:::toc

# Parse functions for testing
parse_elapsed <- function(msg) {
  as.numeric(gsub("^\\[([0-9.]+)\\s+[a-zA-Z]+\\]\n$", "\\1", msg))
}

parse_expr_elapsed <- function(msg) {
  elapsed_tic <- as.numeric(gsub("^\\[([0-9.]+)\\s+[a-zA-Z]+\\]\\s+\\+([0-9.]+)\\s+[a-zA-Z]+\\s+:\\s+.*\n$", "\\1", msg))
  elapsed_dt <- as.numeric(gsub("^\\[([0-9.]+)\\s+[a-zA-Z]+\\]\\s+\\+([0-9.]+)\\s+[a-zA-Z]+\\s+:\\s+.*\n$", "\\2", msg))
  list(tic = elapsed_tic, dt = elapsed_dt)
}

# 1. Test tic() / toc() existence and basic class / visibility
stopifnot(
  is.function(tic),
  is.function(toc)
)

# 2. Test basic tic() and toc() message outputs and parsing
res <- record_relay({
  tic()
  Sys.sleep(0.1)
  toc()
})

stopifnot(
  length(res$msgs) == 2L,
  grepl("^\\[[0-9.]+\\s+[a-zA-Z]+\\]\n$", res$msgs[1]),
  grepl("^\\[[0-9.]+\\s+[a-zA-Z]+\\]\n$", res$msgs[2]),
  parse_elapsed(res$msgs[1]) == 0,
  parse_elapsed(res$msgs[2]) >= 0.09
)

# 3. Test reset argument
res_reset <- record_relay({
  tic()
  Sys.sleep(0.1)
  toc(reset = TRUE)
  Sys.sleep(0.1)
  toc()
})

stopifnot(
  length(res_reset$msgs) == 3L,
  parse_elapsed(res_reset$msgs[1]) == 0,
  parse_elapsed(res_reset$msgs[2]) == 0,
  parse_elapsed(res_reset$msgs[3]) >= 0.09
)

# 4. Test expression evaluation and return value
res_expr <- record_relay({
  tic()
  val <- toc(1 + 2)
  stopifnot(val == 3)
})

stopifnot(
  length(res_expr$msgs) == 2L,
  grepl("^\\[[0-9.]+\\s+[a-zA-Z]+\\]\\s+\\+[0-9.]+\\s+[a-zA-Z]+\\s+:\\s+.*\n$", res_expr$msgs[2])
)

# 5. Test width parameter
res_width <- record_relay({
  tic()
  toc(Sys.sleep(0.01), width = 10L)
})

stopifnot(
  length(res_width$msgs) == 2L,
  # Code should be truncated to "Sys.sleep( ..."
  grepl("Sys.sleep\\( \\.\\.\\.", res_width$msgs[2])
)

# 6. Test expression with error
res_err <- record_relay({
  tic()
  try(toc(stop("my_error")), silent = TRUE)
})

stopifnot(
  length(res_err$msgs) == 2L,
  grepl("stop\\(\"my_error\"\\)", res_err$msgs[2])
)

message("*** toc/tic ... DONE")
