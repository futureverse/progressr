# Use Progressr in Shiny Apps: Plug-in Backward-Compatible Replacement for shiny::withProgress()

A plug-in, backward-compatible replacement for
[`shiny::withProgress()`](https://rdrr.io/pkg/shiny/man/withProgress.html).

## Usage

``` r
withProgressShiny(
  expr,
  ...,
  message = NULL,
  detail = NULL,
  inputs = list(message = NULL, detail = "message"),
  env = parent.frame(),
  quoted = FALSE,
  handlers = c(shiny = handler_shiny, progressr::handlers(default = NULL))
)
```

## Arguments

- expr, ..., env, quoted:

  Arguments passed to
  [`shiny::withProgress()`](https://rdrr.io/pkg/shiny/man/withProgress.html)
  as is.

- message, detail:

  (character string) The message and the detail message to be passed to
  [`shiny::withProgress()`](https://rdrr.io/pkg/shiny/man/withProgress.html).

- inputs:

  (named list) Specifies from what sources the Shiny progress elements
  'message' and 'detail' should be updated. Valid sources are
  `"message"`, `"sticky_message"` and `"non_sticky_message"`, where
  `"message"` is short for `c("non_sticky_message", "sticky_message")`.
  For example,
  `inputs = list(message = "sticky_message", detail = "message")` will
  update the Shiny 'message' component from sticky messages only,
  whereas the 'detail' component is updated using any message.

- handlers:

  Zero or more progression handlers used to report on progress.

## Value

The value of
[shiny::withProgress](https://rdrr.io/pkg/shiny/man/withProgress.html).

## Requirements

This function requires the shiny package and will use the
[`handler_shiny()`](https://progressr.futureverse.org/reference/handler_shiny.md)
**progressr** handler internally to report on updates.

## Examples

``` r
library(shiny)
library(progressr)

app <- shinyApp(
  ui = fluidPage(
    plotOutput("plot")
  ),

  server = function(input, output) {
    output$plot <- renderPlot({
      X <- 1:15
      withProgressShiny(message = "Calculation in progress",
                        detail = "Starting ...",
                        value = 0, {
        p <- progressor(along = X)
        y <- lapply(X, FUN=function(x) {
          Sys.sleep(0.25)
          p(sprintf("x=%d", x))
        })
      })
      
      plot(cars)

      ## Terminate the Shiny app
      Sys.sleep(1.0)
      stopApp(returnValue = invisible())
    })
  }
)

local({
  oopts <- options(device.ask.default = FALSE)
  on.exit(options(oopts))
  if (interactive()) print(app)
})
```
