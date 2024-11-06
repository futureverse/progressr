pkg <- "ntfy"
if (requireNamespace(pkg, quietly = TRUE)) {
  ## We need to specify a ntfy.sh topic that progress messages
  ## should be sent to. See help("ntfy_topic", package = "ntfy")
  ## for details
  Sys.setenv(NTFY_TOPIC = "R-my-secret-topic")

  handlers("ntfy")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
}
