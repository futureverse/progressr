# A progressr handler useful for Futureverse tutorials

A progressr handler useful for Futureverse tutorials

## Usage

``` r
handler_tutorial(
  ...,
  spec = c("progress", "cli"),
  type = "time",
  clear = FALSE
)
```

## Arguments

- spec:

  The progress handler to use.

- type:

  Controls which predefined handler format string to use.

- clear:

  (logical) If TRUE, any output, typically visual, produced by a
  reporter will be cleared/removed upon completion, if possible.

- ...:

  Arguments passed to the selected progress handler.

## Value

A function of class `progression_handler` that takes a
[progression](https://progressr.futureverse.org/reference/progression.md)
condition as its first and only argument.

## Details

The default is to use the progress package. Contrary to cli, progress
has the capacity to display *all* progress updates, even when recieved
at a high rate from via parallel processing.

## Examples

``` r
# Display progress and keep the progress output when done
handlers("tutorial")

# Display progress and keep every progress reported
handlers("tutorial", "newline")
```
