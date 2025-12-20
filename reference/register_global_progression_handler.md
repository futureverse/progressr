# Add or Remove a Global 'progression' Handler

Add or Remove a Global 'progression' Handler

## Usage

``` r
register_global_progression_handler(action = c("add", "remove", "query"))
```

## Arguments

- action:

  (character string) If `"add"`, a global handler is added. If
  `"remove"`, it is removed, if it exists. If `"query"`, checks whether
  a handler is registered or not.

## Value

Returns TRUE if a handler is registered, otherwise FALSE. If
`action = "query"`, the value is visible, otherwise invisible.

## Requirements

This function requires R (\>= 4.0.0) - the version in which global
calling handlers where introduces.

## Examples
