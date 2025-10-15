## Settings
options(progressr.clear = TRUE)
options(progressr.debug = FALSE)
options(progressr.demo.delay = 0.0)
options(progressr.enable = TRUE)
options(progressr.enable_after = 0.0)
options(progressr.interval = 0.1)
options(progressr.times = +Inf)


options(progressr.tests.fake_handlers = c(non_supported_progression_handlers(), "handler_beepr", "handler_notifier", "handler_progress"))
