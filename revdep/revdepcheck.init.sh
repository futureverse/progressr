#! /usr/bin/env bash

## Missing or outdated LaTeX packages
false && R --quiet --no-save <<EOF
    tinytex::install_tinytex(force = TRUE)
    message("TeX root: ", tinytex::tinytex_root())
    tinytex::tlmgr_update()
    tinytex::tlmgr_install("multirow")    # econet
    tinytex::tlmgr_install("colortbl")    # poppr
EOF

## Non-default system dependencies
if command -v module &> /dev/null; then
#    module try-load CBI htslib  ## iscream
fi    


## ---------------------------------------------------------------------
## Phase 1
## ---------------------------------------------------------------------

## Add packages to check
revdep/run.R --add-children

## Drop packages failing on CRAN (2026-07-04)
# revdep/run.R --rm fmeffects

## Drop packages no longer on CRAN (2026-07-04)
# revdep/run.R --rm ...

## Drop packages failing on Bioconductor (2026-07-04)
# revdep/run.R --rm ...

## Missing tools
#revdep/run.R --rm proffer  # requires 'RProtoBuf' -> ProtoBuf library

## Errors for unknown reason
## 'iscream' fails with "error in evaluating the argument 'obj' in selecting a method
## for function 'unname': 'file_test("-x", bin)' is not TRUE" despite having 'tabix'
## on the PATH /2026-03-13 
#revdep/run.R --rm iscream


## Too many threads /2026-07-05
pkgs_threads=()
revdep/run.R --rm "${pkgs_threads[@]}"

## Too many cores /2026-07-04
pkgs_cores=(ISAnalytics powRICLPM riemtan vecmatch)
revdep/run.R --rm "${pkgs_cores[@]}"

## Requires sequential processing due to clashes, e.g. port and cache
pkgs_seq=() /2026-07-04
revdep/run.R --rm "${pkgs_seq[@]}"

## Run revdep check
revdep/run.R


## ---------------------------------------------------------------------
## Phase 2
## ---------------------------------------------------------------------
## Set: Too many threads
revdep/run.R --add "${pkgs_threads[@]}"
OMP_NUM_THREADS=4 revdep/run.R

## Set: Too many cores
revdep/run.R --add "${pkgs_cores[@]}"
OMP_NUM_THREADS=4 NSLOTS=4 revdep/run.R

## Sequential
revdep/run.R --add "${pkgs_seq[@]}"
NSLOTS=1 revdep/run.R
