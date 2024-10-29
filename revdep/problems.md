# AIPW

<details>

* Version: 0.6.3.2
* GitHub: https://github.com/yqzhong7/AIPW
* Source code: https://github.com/cran/AIPW
* Date/Publication: 2021-06-11 09:30:02 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::revdep_details(, "AIPW")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Rsolnp’ ‘SuperLearner’ ‘future.apply’ ‘ggplot2’ ‘progressr’ ‘stats’
      ‘utils’
      All declared Imports should be used.
    ```

# AlpsNMR

<details>

* Version: 4.6.0
* GitHub: https://github.com/sipss/AlpsNMR
* Source code: https://github.com/cran/AlpsNMR
* Date/Publication: 2024-04-30
* Number of recursive dependencies: 174

Run `revdepcheck::revdep_details(, "AlpsNMR")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Vig01-introduction-to-alpsnmr.Rmd’ using rmarkdown
    Error: processing vignette 'Vig01-introduction-to-alpsnmr.Rmd' failed with diagnostics:
    LaTeX failed to compile /c4/home/henrik/repositories/progressr/revdep/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig01-introduction-to-alpsnmr.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
    --- failed re-building ‘Vig01-introduction-to-alpsnmr.Rmd’
    
    --- re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’ using rmarkdown
    Error: processing vignette 'Vig01b-introduction-to-alpsnmr-old-api.Rmd' failed with diagnostics:
    LaTeX failed to compile /c4/home/henrik/repositories/progressr/revdep/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig01b-introduction-to-alpsnmr-old-api.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
    ...
    LaTeX failed to compile /c4/home/henrik/repositories/progressr/revdep/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig02-handling-metadata-and-annotations.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
    --- failed re-building ‘Vig02-handling-metadata-and-annotations.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Vig01-introduction-to-alpsnmr.Rmd’
      ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’
      ‘Vig02-handling-metadata-and-annotations.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# baskexact

<details>

* Version: 1.0.1
* GitHub: https://github.com/lbau7/baskexact
* Source code: https://github.com/cran/baskexact
* Date/Publication: 2024-04-09 13:30:02 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::revdep_details(, "baskexact")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# bayesmove

<details>

* Version: 0.2.1
* GitHub: https://github.com/joshcullen/bayesmove
* Source code: https://github.com/cran/bayesmove
* Date/Publication: 2021-10-22 08:50:09 UTC
* Number of recursive dependencies: 166

Run `revdepcheck::revdep_details(, "bayesmove")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) insert_NAs.Rd:22: Lost braces; missing escapes or markup?
        22 | A data frame where new rows have been inserted to regularize the \code{date} column. This results in values provided for \code{id}, \code{date}, and {dt} while inserting NAs for all other columns. Additionally, observations with duplicate date-times are removed.
           |                                                                                                                                                      ^
    ```

# crumble

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/crumble
* Date/Publication: 2024-09-18 11:50:05 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::revdep_details(, "crumble")` for more info

</details>

## In both

*   checking package dependencies ... ERROR
    ```
    Package required but not available: ‘Rsymphony’
    
    See section ‘The DESCRIPTION file’ in the ‘Writing R Extensions’
    manual.
    ```

# cSEM

<details>

* Version: 0.5.0
* GitHub: https://github.com/M-E-Rademaker/cSEM
* Source code: https://github.com/cran/cSEM
* Date/Publication: 2022-11-24 17:50:05 UTC
* Number of recursive dependencies: 128

Run `revdepcheck::revdep_details(, "cSEM")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) calculateEffects.Rd:24: Lost braces; missing escapes or markup?
        24 | equals (I-B)^{-1}Gamma. The indirect effect equals the difference between
           |              ^
    ```

# deseats

<details>

* Version: 1.1.0
* GitHub: NA
* Source code: https://github.com/cran/deseats
* Date/Publication: 2024-07-12 10:50:15 UTC
* Number of recursive dependencies: 115

Run `revdepcheck::revdep_details(, "deseats")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.6Mb
      sub-directories of 1Mb or more:
        libs   7.8Mb
    ```

# dipsaus

<details>

* Version: 0.2.9
* GitHub: https://github.com/dipterix/dipsaus
* Source code: https://github.com/cran/dipsaus
* Date/Publication: 2024-06-27 11:10:01 UTC
* Number of recursive dependencies: 69

Run `revdepcheck::revdep_details(, "dipsaus")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.7Mb
      sub-directories of 1Mb or more:
        doc    1.1Mb
        libs   4.2Mb
    ```

# econet

<details>

* Version: 1.0.0.1
* GitHub: NA
* Source code: https://github.com/cran/econet
* Date/Publication: 2024-07-31 10:59:28 UTC
* Number of recursive dependencies: 64

Run `revdepcheck::revdep_details(, "econet")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘econet.tex’ using tex
    Warning in texi2dvi(pathnameR, pdf = pdf, clean = clean, quiet = quiet,  :
      texi2dvi script/program not available, using emulation
    Error: processing vignette 'econet.tex' failed with diagnostics:
    unable to run pdflatex on 'econet.tex'
    LaTeX errors:
    ! LaTeX Error: File `orcidlink.sty' not found.
    
    ...
    l.5 \graphicspath
                     {{Figures/}}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘econet.tex’
    
    SUMMARY: processing the following file failed:
      ‘econet.tex’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed files from ‘inst/doc’ ... NOTE
    ```
    The following files should probably not be installed:
      ‘econet.tex’
    
    Consider the use of a .Rinstignore file: see ‘Writing R Extensions’,
    or move the vignette sources from ‘inst/doc’ to ‘vignettes’.
    ```

# EFAtools

<details>

* Version: 0.4.4
* GitHub: https://github.com/mdsteiner/EFAtools
* Source code: https://github.com/cran/EFAtools
* Date/Publication: 2023-01-06 14:50:40 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::revdep_details(, "EFAtools")` for more info

</details>

## In both

*   checking C++ specification ... NOTE
    ```
      Specified C++11: please drop specification unless essential
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.5Mb
      sub-directories of 1Mb or more:
        libs   6.2Mb
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘progress’
      All declared Imports should be used.
    ```

# EpiModel

<details>

* Version: 2.5.0
* GitHub: https://github.com/EpiModel/EpiModel
* Source code: https://github.com/cran/EpiModel
* Date/Publication: 2024-10-11 17:50:02 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::revdep_details(, "EpiModel")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        doc    2.8Mb
        libs   1.2Mb
    ```

# EpiNow2

<details>

* Version: 1.6.0
* GitHub: https://github.com/epiforecasts/EpiNow2
* Source code: https://github.com/cran/EpiNow2
* Date/Publication: 2024-10-02 20:20:22 UTC
* Number of recursive dependencies: 132

Run `revdepcheck::revdep_details(, "EpiNow2")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘cmdstanr’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 240.1Mb
      sub-directories of 1Mb or more:
        doc        1.4Mb
        extdata    2.3Mb
        libs     234.9Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘cmdstanr’
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# fastRhockey

<details>

* Version: 0.4.0
* GitHub: https://github.com/sportsdataverse/fastRhockey
* Source code: https://github.com/cran/fastRhockey
* Date/Publication: 2022-10-25 20:55:15 UTC
* Number of recursive dependencies: 116

Run `revdepcheck::revdep_details(, "fastRhockey")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) update_nhl_db.Rd:51-53: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) update_nhl_db.Rd:54-57: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) update_phf_db.Rd:51-53: Lost braces in \itemize; meant \describe ?
    checkRd: (-1) update_phf_db.Rd:54-57: Lost braces in \itemize; meant \describe ?
    ```

# fdacluster

<details>

* Version: 0.3.0
* GitHub: https://github.com/astamm/fdacluster
* Source code: https://github.com/cran/fdacluster
* Date/Publication: 2023-07-04 15:53:04 UTC
* Number of recursive dependencies: 127

Run `revdepcheck::revdep_details(, "fdacluster")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.7Mb
      sub-directories of 1Mb or more:
        R      1.8Mb
        doc    1.5Mb
        help   2.1Mb
        libs  16.8Mb
    ```

# geocmeans

<details>

* Version: 0.3.4
* GitHub: https://github.com/JeremyGelb/geocmeans
* Source code: https://github.com/cran/geocmeans
* Date/Publication: 2023-09-12 03:10:02 UTC
* Number of recursive dependencies: 200

Run `revdepcheck::revdep_details(, "geocmeans")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 14.3Mb
      sub-directories of 1Mb or more:
        extdata   3.0Mb
        libs      9.0Mb
    ```

# GeoModels

<details>

* Version: 2.0.7
* GitHub: https://github.com/vmoprojs/GeoModels
* Source code: https://github.com/cran/GeoModels
* Date/Publication: 2024-10-25 21:30:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::revdep_details(, "GeoModels")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.2Mb
      sub-directories of 1Mb or more:
        R      1.0Mb
        data   1.9Mb
        libs   2.8Mb
    ```

# gtfs2gps

<details>

* Version: 2.1-2
* GitHub: https://github.com/ipeaGIT/gtfs2gps
* Source code: https://github.com/cran/gtfs2gps
* Date/Publication: 2024-10-08 07:00:06 UTC
* Number of recursive dependencies: 86

Run `revdepcheck::revdep_details(, "gtfs2gps")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(gtfs2gps)
      gtfs2gps version 2.1-2 is now loaded
      NOTE: All filter functions from gtfs2gps were removed
      Please replace them by similar functions from gtfstools
      > 
    ...
       4.     └─terra (local) .local(x, ...)
       5.       ├─terra::makeValid(x)
       6.       └─terra::makeValid(x)
       7.         └─terra (local) .local(x, ...)
       8.           └─terra:::messages(x)
       9.             └─terra:::error(f, x@ptr$getError())
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 119 ]
      Error: Test failures
      Execution halted
    ```

# hbamr

<details>

* Version: 2.3.2
* GitHub: https://github.com/jbolstad/hbamr
* Source code: https://github.com/cran/hbamr
* Date/Publication: 2024-09-23 12:20:07 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::revdep_details(, "hbamr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 342.4Mb
      sub-directories of 1Mb or more:
        libs  340.7Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# ISAnalytics

<details>

* Version: 1.14.0
* GitHub: https://github.com/calabrialab/ISAnalytics
* Source code: https://github.com/cran/ISAnalytics
* Date/Publication: 2024-04-30
* Number of recursive dependencies: 178

Run `revdepcheck::revdep_details(, "ISAnalytics")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘ISAnalytics-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: CIS_grubbs
    > ### Title: Grubbs test for Common Insertion Sites (CIS).
    > ### Aliases: CIS_grubbs
    > 
    > ### ** Examples
    > 
    > data("integration_matrices", package = "ISAnalytics")
    > cis <- CIS_grubbs(integration_matrices)
    Error in print.data.table(missing_genes, n = Inf) : 
      argument 2 matches multiple formal arguments
    Calls: CIS_grubbs ... paste -> paste0 -> <Anonymous> -> withVisible -> print
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        data   1.4Mb
        doc    3.6Mb
    ```

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) refGenes_hg19.Rd:21: Lost braces; missing escapes or markup?
        21 | \item Download from {http://hgdownload.soe.ucsc.edu/goldenPath/hg19/database/}
           |                     ^
    ```

# kmeRtone

<details>

* Version: 1.0
* GitHub: https://github.com/SahakyanLab/kmeRtone
* Source code: https://github.com/cran/kmeRtone
* Date/Publication: 2024-08-30 10:50:06 UTC
* Number of recursive dependencies: 82

Run `revdepcheck::revdep_details(, "kmeRtone")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.9Mb
      sub-directories of 1Mb or more:
        libs   8.4Mb
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# lava

<details>

* Version: 1.8.0
* GitHub: https://github.com/kkholst/lava
* Source code: https://github.com/cran/lava
* Date/Publication: 2024-03-05 13:00:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::revdep_details(, "lava")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘lavaSearch2’
    ```

# lightr

<details>

* Version: 1.7.1
* GitHub: https://github.com/ropensci/lightr
* Source code: https://github.com/cran/lightr
* Date/Publication: 2024-03-21 21:50:10 UTC
* Number of recursive dependencies: 92

Run `revdepcheck::revdep_details(, "lightr")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘pavo’
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘pavo’
    ```

# mapme.biodiversity

<details>

* Version: 0.9.3
* GitHub: https://github.com/mapme-initiative/mapme.biodiversity
* Source code: https://github.com/cran/mapme.biodiversity
* Date/Publication: 2024-10-21 08:10:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::revdep_details(, "mapme.biodiversity")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 50 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-calc_deforestation_drivers.R:16:3'): deforestation drivers works ──
      `.check_single_asset(result)` produced warnings.
      ── Failure ('test-calc_deforestation_drivers.R:17:3'): deforestation drivers works ──
      unique(result$variable) (`actual`) not equal to c(...) (`expected`).
      
    ...
       12. │               └─jsonlite:::parseJSON(txt, bigint_as_char)
       13. │                 └─jsonlite:::parse_string(txt, bigint_as_char)
       14. └─base::.handleSimpleError(...)
       15.   └─purrr (local) h(simpleError(msg, call))
       16.     └─cli::cli_abort(...)
       17.       └─rlang::abort(...)
      
      [ FAIL 5 | WARN 1 | SKIP 38 | PASS 560 ]
      Error: Test failures
      Execution halted
    ```

# mikropml

<details>

* Version: 1.6.1
* GitHub: https://github.com/SchlossLab/mikropml
* Source code: https://github.com/cran/mikropml
* Date/Publication: 2023-08-21 15:10:05 UTC
* Number of recursive dependencies: 130

Run `revdepcheck::revdep_details(, "mikropml")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) create_grouped_data_partition.Rd:60: Lost braces; missing escapes or markup?
        60 | Zena Lapp, {zenalapp@umich.edu}
           |            ^
    checkRd: (-1) create_grouped_data_partition.Rd:62: Lost braces; missing escapes or markup?
        62 | Kelly Sovacool, {sovacool@umich.edu}
           |                 ^
    checkRd: (-1) create_grouped_k_multifolds.Rd:30: Lost braces; missing escapes or markup?
        30 | Zena Lapp, {zenalapp@umich.edu}
           |            ^
    checkRd: (-1) get_partition_indices.Rd:58: Lost braces; missing escapes or markup?
        58 | Kelly Sovacool, {sovacool@umich.edu}
           |                 ^
    checkRd: (-1) set_hparams_glmnet.Rd:16: Lost braces; missing escapes or markup?
        16 | Zena Lapp, {zenalapp@umich.edu}
           |            ^
    ```

# modeltime.resample

<details>

* Version: 0.2.3
* GitHub: https://github.com/business-science/modeltime.resample
* Source code: https://github.com/cran/modeltime.resample
* Date/Publication: 2023-04-12 15:50:02 UTC
* Number of recursive dependencies: 227

Run `revdepcheck::revdep_details(, "modeltime.resample")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘crayon’ ‘dials’ ‘glue’ ‘parsnip’
      All declared Imports should be used.
    ```

# nflseedR

<details>

* Version: 1.2.0
* GitHub: https://github.com/nflverse/nflseedR
* Source code: https://github.com/cran/nflseedR
* Date/Publication: 2023-01-05 21:50:31 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::revdep_details(, "nflseedR")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) load_schedules.Rd:27: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:28: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:29: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:30: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:31: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:60: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:61: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:62: Lost braces in \itemize; \value handles \item{}{} directly
    checkRd: (-1) load_schedules.Rd:63: Lost braces in \itemize; \value handles \item{}{} directly
    ```

# oddsapiR

<details>

* Version: 0.0.3
* GitHub: https://github.com/sportsdataverse/oddsapiR
* Source code: https://github.com/cran/oddsapiR
* Date/Publication: 2023-03-19 18:50:02 UTC
* Number of recursive dependencies: 120

Run `revdepcheck::revdep_details(, "oddsapiR")` for more info

</details>

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4 marked UTF-8 strings
    ```

# pavo

<details>

* Version: 2.9.0
* GitHub: https://github.com/rmaia/pavo
* Source code: https://github.com/cran/pavo
* Date/Publication: 2023-09-24 10:10:02 UTC
* Number of recursive dependencies: 103

Run `revdepcheck::revdep_details(, "pavo")` for more info

</details>

## In both

*   checking whether package ‘pavo’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/c4/home/henrik/repositories/progressr/revdep/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
    ```

# PWIR

<details>

* Version: 0.0.3
* GitHub: NA
* Source code: https://github.com/cran/PWIR
* Date/Publication: 2023-10-20 09:50:02 UTC
* Number of recursive dependencies: 110

Run `revdepcheck::revdep_details(, "PWIR")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘progressr’
      All declared Imports should be used.
    ```

# RAINBOWR

<details>

* Version: 0.1.35
* GitHub: NA
* Source code: https://github.com/cran/RAINBOWR
* Date/Publication: 2024-03-03 09:12:36 UTC
* Number of recursive dependencies: 154

Run `revdepcheck::revdep_details(, "RAINBOWR")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 42.9Mb
      sub-directories of 1Mb or more:
        libs  41.5Mb
    ```

# receptiviti

<details>

* Version: 0.1.8
* GitHub: https://github.com/Receptiviti/receptiviti-r
* Source code: https://github.com/cran/receptiviti
* Date/Publication: 2024-03-29 18:00:03 UTC
* Number of recursive dependencies: 66

Run `revdepcheck::revdep_details(, "receptiviti")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(receptiviti)
      > 
      > test_check("receptiviti")
      Status: ERROR
      Message: Invalid header received from client.
    ...
       7. └─receptiviti::receptiviti(...)
      ── Failure ('test-receptiviti_status.R:5:3'): failures works ───────────────────
      receptiviti_status(...) is not NULL
      
      `actual` is a list
      `expected` is NULL
      
      [ FAIL 2 | WARN 0 | SKIP 2 | PASS 6 ]
      Error: Test failures
      Execution halted
    ```

# rTwig

<details>

* Version: 1.1.0
* GitHub: https://github.com/aidanmorales/rTwig
* Source code: https://github.com/cran/rTwig
* Date/Publication: 2024-08-21 00:50:02 UTC
* Number of recursive dependencies: 148

Run `revdepcheck::revdep_details(, "rTwig")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.0Mb
      sub-directories of 1Mb or more:
        libs   6.1Mb
    ```

# sentopics

<details>

* Version: 0.7.4
* GitHub: https://github.com/odelmarcelle/sentopics
* Source code: https://github.com/cran/sentopics
* Date/Publication: 2024-09-20 12:20:02 UTC
* Number of recursive dependencies: 172

Run `revdepcheck::revdep_details(, "sentopics")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  8.3Mb
      sub-directories of 1Mb or more:
        data   1.2Mb
        libs   6.2Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘lexicon’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3128 marked UTF-8 strings
    ```

# Seurat

<details>

* Version: 5.1.0
* GitHub: https://github.com/satijalab/seurat
* Source code: https://github.com/cran/Seurat
* Date/Publication: 2024-05-10 17:23:17 UTC
* Number of recursive dependencies: 267

Run `revdepcheck::revdep_details(, "Seurat")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Packages suggested but not available for checking: 'BPCells', 'presto'
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 16.0Mb
      sub-directories of 1Mb or more:
        R      1.7Mb
        libs  13.5Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Signac’
    ```

# SeuratObject

<details>

* Version: 5.0.2
* GitHub: https://github.com/satijalab/seurat-object
* Source code: https://github.com/cran/SeuratObject
* Date/Publication: 2024-05-08 13:40:06 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::revdep_details(, "SeuratObject")` for more info

</details>

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘BPCells’
    
    Package which this enhances but not available for checking: ‘Seurat’
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.1Mb
      sub-directories of 1Mb or more:
        R      2.0Mb
        libs   3.2Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plotly’
    ```

# SimDesign

<details>

* Version: 2.17.1
* GitHub: https://github.com/philchalmers/SimDesign
* Source code: https://github.com/cran/SimDesign
* Date/Publication: 2024-08-17 05:00:02 UTC
* Number of recursive dependencies: 136

Run `revdepcheck::revdep_details(, "SimDesign")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  7.3Mb
      sub-directories of 1Mb or more:
        doc   6.5Mb
    ```

# skpr

<details>

* Version: 1.7.1
* GitHub: https://github.com/tylermorganwall/skpr
* Source code: https://github.com/cran/skpr
* Date/Publication: 2024-03-26 01:30:02 UTC
* Number of recursive dependencies: 153

Run `revdepcheck::revdep_details(, "skpr")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 59.6Mb
      sub-directories of 1Mb or more:
        libs  59.0Mb
    ```

# smoots

<details>

* Version: 1.1.4
* GitHub: NA
* Source code: https://github.com/cran/smoots
* Date/Publication: 2023-09-11 08:50:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::revdep_details(, "smoots")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.2Mb
      sub-directories of 1Mb or more:
        libs   4.5Mb
    ```

# sphunif

<details>

* Version: 1.4.0
* GitHub: https://github.com/egarpor/sphunif
* Source code: https://github.com/cran/sphunif
* Date/Publication: 2024-05-24 21:50:01 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::revdep_details(, "sphunif")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 25.1Mb
      sub-directories of 1Mb or more:
        libs  24.0Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 189 marked UTF-8 strings
    ```

# spNetwork

<details>

* Version: 0.4.4.3
* GitHub: https://github.com/JeremyGelb/spNetwork
* Source code: https://github.com/cran/spNetwork
* Date/Publication: 2024-06-21 21:40:02 UTC
* Number of recursive dependencies: 143

Run `revdepcheck::revdep_details(, "spNetwork")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 27.6Mb
      sub-directories of 1Mb or more:
        extdata   2.6Mb
        libs     22.6Mb
    ```

# squat

<details>

* Version: 0.3.0
* GitHub: https://github.com/LMJL-Alea/squat
* Source code: https://github.com/cran/squat
* Date/Publication: 2024-01-10 15:40:02 UTC
* Number of recursive dependencies: 141

Run `revdepcheck::revdep_details(, "squat")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 19.9Mb
      sub-directories of 1Mb or more:
        data   1.1Mb
        help   1.1Mb
        libs  17.5Mb
    ```

# stppSim

<details>

* Version: 1.3.4
* GitHub: https://github.com/Manalytics/stppSim
* Source code: https://github.com/cran/stppSim
* Date/Publication: 2024-07-24 13:30:02 UTC
* Number of recursive dependencies: 131

Run `revdepcheck::revdep_details(, "stppSim")` for more info

</details>

## In both

*   checking whether package ‘stppSim’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/c4/home/henrik/repositories/progressr/revdep/checks/stppSim/new/stppSim.Rcheck/00install.out’ for details.
    ```

# targeted

<details>

* Version: 0.5
* GitHub: https://github.com/kkholst/targeted
* Source code: https://github.com/cran/targeted
* Date/Publication: 2024-02-22 10:00:21 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::revdep_details(, "targeted")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 23.0Mb
      sub-directories of 1Mb or more:
        doc    1.1Mb
        libs  21.3Mb
    ```

# tsdistributions

<details>

* Version: 1.0.2
* GitHub: https://github.com/tsmodels/tsdistributions
* Source code: https://github.com/cran/tsdistributions
* Date/Publication: 2024-08-23 04:20:02 UTC
* Number of recursive dependencies: 79

Run `revdepcheck::revdep_details(, "tsdistributions")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘estimation_demo.Rmd’ using rmarkdown
    --- finished re-building ‘estimation_demo.Rmd’
    
    --- re-building ‘location_scale_distributions.Rmd’ using rmarkdown
    ! Undefined control sequence.
    l.56 \NewDocumentCommand
                            \citeproctext{}{} 
    
    ...
    --- finished re-building ‘profile_demo.Rmd’
    
    --- re-building ‘spd_demo.Rmd’ using rmarkdown
    --- finished re-building ‘spd_demo.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘location_scale_distributions.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 42.8Mb
      sub-directories of 1Mb or more:
        libs  42.1Mb
    ```

# tsgarch

<details>

* Version: 1.0.3
* GitHub: https://github.com/tsmodels/tsgarch
* Source code: https://github.com/cran/tsgarch
* Date/Publication: 2024-10-12 00:50:02 UTC
* Number of recursive dependencies: 100

Run `revdepcheck::revdep_details(, "tsgarch")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 144.2Mb
      sub-directories of 1Mb or more:
        libs  143.1Mb
    ```

# vital

<details>

* Version: 1.1.0
* GitHub: https://github.com/robjhyndman/vital
* Source code: https://github.com/cran/vital
* Date/Publication: 2024-06-21 08:00:02 UTC
* Number of recursive dependencies: 201

Run `revdepcheck::revdep_details(, "vital")` for more info

</details>

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.0Mb
      sub-directories of 1Mb or more:
        data   4.4Mb
        help   1.3Mb
    ```

# vmeasur

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/vmeasur
* Date/Publication: 2021-11-11 19:00:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::revdep_details(, "vmeasur")` for more info

</details>

## In both

*   checking whether package ‘vmeasur’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/c4/home/henrik/repositories/progressr/revdep/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
    ```

# WeightedCluster

<details>

* Version: 1.8-0
* GitHub: NA
* Source code: https://github.com/cran/WeightedCluster
* Date/Publication: 2024-10-02 15:30:02 UTC
* Number of recursive dependencies: 45

Run `revdepcheck::revdep_details(, "WeightedCluster")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘WeightedCluster.Rnw’ using knitr
    Warning in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  :
      texi2dvi script/program not available, using emulation
    --- finished re-building ‘WeightedCluster.Rnw’
    
    --- re-building ‘WeightedClusterFR.Rnw’ using knitr
    Warning in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  :
      texi2dvi script/program not available, using emulation
    Error: processing vignette 'WeightedClusterFR.Rnw' failed with diagnostics:
    ...
    l.85 \usepackage
                    {tikz}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘WeightedClusterPreview.Rnw’
    
    SUMMARY: processing the following files failed:
      ‘WeightedClusterFR.Rnw’ ‘WeightedClusterPreview.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

