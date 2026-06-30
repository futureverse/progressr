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
#' toc <- progressr:::toc
#'
#' Sys.sleep(1.2) |> toc()
#' Sys.sleep(0.2) |> toc()
#' toc()
#'
#' toc(reset = FALSE)
#' Sys.sleep(1.2) |> toc()
#'
#' @noRd
toc <- local({
  start <- NULL
             
  function(expr = NULL, reset = FALSE) {
    t0 <- Sys.time()
    if (isTRUE(reset) || is.null(start)) start <<- t0
    if (missing(expr)) {
      dt_start <- round(difftime(t0, start), digits = 1L)
      message(sprintf("[%s]", format(dt_start)))
      return(invisible())
    }
    
    res <- eval(substitute(expr), envir = parent.frame())
    t1 <- Sys.time()
    dt <- round(difftime(t1, t0), digits = 2L)
    dt_tic <- round(difftime(t0, start), digits = 1L)
    message(sprintf("[%s] +%s", format(dt_tic), format(dt)))
    res    
  }
})    
