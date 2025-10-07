## Private package functions
`%||%` <- progressr:::`%||%`
hpaste <- progressr:::hpaste
mdebug <- progressr:::mdebug
mprint <- progressr:::mprint
mprintf <- progressr:::mprintf
mstr <- progressr:::mstr
query_r_cmd_check <- progressr:::query_r_cmd_check
in_r_cmd_check <- progressr:::in_r_cmd_check
stop_if_not <- progressr:::stop_if_not
printf <- function(...) cat(sprintf(...))
known_progression_handlers <- progressr:::known_progression_handlers
