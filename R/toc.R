#' Evaluate expression with stop watch reporting
#'
#' @param expr (optional) Expression to be evaluated and timed.
#'
#' @param reset (optional) If TRUE, the internal timer is reset.
#'
#' @return
#' Return the value of `expr`, if specified, otherwise NULL invisible.
#' 
#' @examples
#' tic <- progressr:::tic
#' toc <- progressr:::toc
#'
#' tic()
#' Sys.sleep(1.2) |> toc()
#' Sys.sleep(0.2) |> toc()
#' toc()
#'
#' tic()
#' Sys.sleep(1.2) |> toc()
#'
#' @noRd
toc <- local({
  start <- NULL
             
  function(expr = NULL, reset = FALSE, width = 30L) {
    t0 <- Sys.time()
    if (isTRUE(reset) || is.null(start)) start <<- t0
    if (missing(expr)) {
      dt_start <- round(difftime(t0, start), digits = 1L)
      message(sprintf("[%s]", format(dt_start)))
      return(invisible())
    }

    on.exit({
      code <- deparse(substitute(expr))
      code <- paste(code, collapse = " ")
      code <- gsub(" +", " ", code)
      if (nchar(code) > width) {
        code <- substr(code[1], start = 1L, stop = width)
        code <- sprintf("%s ...", code)
      }
      t1 <- Sys.time()
      dt <- round(difftime(t1, t0), digits = 2L)
      dt_tic <- round(difftime(t1, start), digits = 1L)
      message(sprintf("[%s] +%s : %s", format(dt_tic), format(dt), code))
    })

    expr
  }
})    

#' @noRd
tic <- function() toc(reset = TRUE)
