# Aggregate Progression Conditions

Aggregate Progression Conditions

## Usage

``` r
progress_aggregator(progress)
```

## Arguments

- progress:

  A
  [progressor](https://progressr.futureverse.org/reference/progressor.md)
  function.

## Value

A function of class `progress_aggregator`.

## Examples

``` r
library(progressr)

message("progress_aggregator() ...")
#> progress_aggregator() ...

with_progress({
  progress <- progressor(steps = 4L)
  relay_progress <- progress_aggregator(progress)
  progress()
  relay_progress(slow_sum(1:3))
  relay_progress(slow_sum(1:10))
  progress()
})
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 4
#> M: Added value 5
#> M: Added value 6
#> M: Added value 7
#> M: Added value 8
#> M: Added value 9
#> M: Added value 10
#> NULL

message("progress_aggregator() ... done")
#> progress_aggregator() ... done
```
