# adestr

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/adestr
* Date/Publication: 2024-07-12 13:50:09 UTC
* Number of recursive dependencies: 135

Run `revdepcheck::revdep_details(, "adestr")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘IntervalEstimator-class.Rd’ ‘PValue-class.Rd’
        ‘PointEstimator-class.Rd’ ‘analyze.R’ ‘estimators.R’
        ‘evaluate_estimator.R’ ‘fisher_information.R’
        ‘integrate_over_sample_space.R’ ‘mle_distribution.R’ ‘n2c2_helpers.R’
        ‘plot.R’ ‘print.R’ ‘reference_implementation.R’
    ```

# AlpsNMR

<details>

* Version: 4.12.0
* GitHub: https://github.com/sipss/AlpsNMR
* Source code: https://github.com/cran/AlpsNMR
* Date/Publication: 2025-10-29
* Number of recursive dependencies: 182

Run `revdepcheck::revdep_details(, "AlpsNMR")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Vig01-introduction-to-alpsnmr.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    Error: processing vignette 'Vig01-introduction-to-alpsnmr.Rmd' failed with diagnostics:
    LaTeX failed to compile /scratch/henrik/revdep/progressr/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig01-introduction-to-alpsnmr.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
    --- failed re-building ‘Vig01-introduction-to-alpsnmr.Rmd’
    
    --- re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    Error: processing vignette 'Vig01b-introduction-to-alpsnmr-old-api.Rmd' failed with diagnostics:
    ...
    LaTeX failed to compile /scratch/henrik/revdep/progressr/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig02-handling-metadata-and-annotations.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
    --- failed re-building ‘Vig02-handling-metadata-and-annotations.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Vig01-introduction-to-alpsnmr.Rmd’
      ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’
      ‘Vig02-handling-metadata-and-annotations.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# baseballr

<details>

* Version: 1.6.0
* GitHub: https://github.com/BillPetti/baseballr
* Source code: https://github.com/cran/baseballr
* Date/Publication: 2024-01-16 12:50:02 UTC
* Number of recursive dependencies: 114

Run `revdepcheck::revdep_details(, "baseballr")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘chadwick_installation.R’
    ```

# baskexact

<details>

* Version: 1.0.1
* GitHub: https://github.com/lbau7/baskexact
* Source code: https://github.com/cran/baskexact
* Date/Publication: 2024-04-09 13:30:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::revdep_details(, "baskexact")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# crumble

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/crumble
* Date/Publication: 2024-12-02 17:50:02 UTC
* Number of recursive dependencies: 142

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

* Version: 0.6.1
* GitHub: https://github.com/FloSchuberth/cSEM
* Source code: https://github.com/cran/cSEM
* Date/Publication: 2025-05-16 09:40:14 UTC
* Number of recursive dependencies: 144

Run `revdepcheck::revdep_details(, "cSEM")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# econet

<details>

* Version: 1.0.0.1
* GitHub: NA
* Source code: https://github.com/cran/econet
* Date/Publication: 2024-07-31 10:59:28 UTC
* Number of recursive dependencies: 62

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

# EFAtools

<details>

* Version: 0.6.1
* GitHub: https://github.com/mdsteiner/EFAtools
* Source code: https://github.com/cran/EFAtools
* Date/Publication: 2025-07-30 14:10:02 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::revdep_details(, "EFAtools")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘progress’
      All declared Imports should be used.
    ```

# fastRhockey

<details>

* Version: 0.4.0
* GitHub: https://github.com/sportsdataverse/fastRhockey
* Source code: https://github.com/cran/fastRhockey
* Date/Publication: 2022-10-25 20:55:15 UTC
* Number of recursive dependencies: 108

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

# ISAnalytics

<details>

* Version: 1.20.0
* GitHub: https://github.com/calabrialab/ISAnalytics
* Source code: https://github.com/cran/ISAnalytics
* Date/Publication: 2025-10-29
* Number of recursive dependencies: 177

Run `revdepcheck::revdep_details(, "ISAnalytics")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) refGenes_hg19.Rd:21: Lost braces; missing escapes or markup?
        21 | \item Download from {http://hgdownload.soe.ucsc.edu/goldenPath/hg19/database/}
           |                     ^
    ```

# mapme.biodiversity

<details>

* Version: 0.9.5
* GitHub: https://github.com/mapme-initiative/mapme.biodiversity
* Source code: https://github.com/cran/mapme.biodiversity
* Date/Publication: 2025-10-06 07:00:02 UTC
* Number of recursive dependencies: 101

Run `revdepcheck::revdep_details(, "mapme.biodiversity")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 50 lines of output:
      > library(mapme.biodiversity)
      > 
      > options(pillar.advice = FALSE)
      > mapme_options(verbose = FALSE)
      > test_check("mapme.biodiversity")
      You agreed to abide to ACLED's Terms of Use (https://acleddata.com/terms-of-use/).
    ...
      Expected `nrow(x2)` to equal 2.
      Differences:
        `actual`: 1.0
      `expected`: 2.0
      
      
      [ FAIL 2 | WARN 0 | SKIP 43 | PASS 543 ]
      Error:
      ! Test failures.
      Execution halted
    ```

# mikropml

<details>

* Version: 1.7.0
* GitHub: https://github.com/SchlossLab/mikropml
* Source code: https://github.com/cran/mikropml
* Date/Publication: 2025-10-29 03:30:02 UTC
* Number of recursive dependencies: 180

Run `revdepcheck::revdep_details(, "mikropml")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘methods’
      All declared Imports should be used.
    ```

# pavo

<details>

* Version: 2.9.0
* GitHub: https://github.com/rmaia/pavo
* Source code: https://github.com/cran/pavo
* Date/Publication: 2023-09-24 10:10:02 UTC
* Number of recursive dependencies: 98

Run `revdepcheck::revdep_details(, "pavo")` for more info

</details>

## In both

*   checking whether package ‘pavo’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/scratch/henrik/revdep/progressr/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
    ```

# powRICLPM

<details>

* Version: 0.2.1
* GitHub: https://github.com/JeroenDMulder/powRICLPM
* Source code: https://github.com/cran/powRICLPM
* Date/Publication: 2024-10-26 13:50:03 UTC
* Number of recursive dependencies: 65

Run `revdepcheck::revdep_details(, "powRICLPM")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘save.R’
    ```

# PWIR

<details>

* Version: 0.0.3.1
* GitHub: NA
* Source code: https://github.com/cran/PWIR
* Date/Publication: 2025-07-24 11:10:17 UTC
* Number of recursive dependencies: 112

Run `revdepcheck::revdep_details(, "PWIR")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘progressr’
      All declared Imports should be used.
    ```

# receptiviti

<details>

* Version: 0.2.0
* GitHub: https://github.com/Receptiviti/receptiviti-r
* Source code: https://github.com/cran/receptiviti
* Date/Publication: 2025-06-07 15:10:02 UTC
* Number of recursive dependencies: 64

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
      Saving _problems/test-receptiviti-18.R
      [ FAIL 1 | WARN 0 | SKIP 4 | PASS 5 ]
    ...
       4. │     ├─testthat (local) .capture(...)
       5. │     │ └─base::withCallingHandlers(...)
       6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       7. └─receptiviti::receptiviti(...)
       8.   └─receptiviti:::manage_request(...)
      
      [ FAIL 1 | WARN 0 | SKIP 4 | PASS 5 ]
      Error:
      ! Test failures.
      Execution halted
    ```

# rsi

<details>

* Version: 0.3.2
* GitHub: https://github.com/Permian-Global-Research/rsi
* Source code: https://github.com/cran/rsi
* Date/Publication: 2025-01-22 03:20:02 UTC
* Number of recursive dependencies: 75

Run `revdepcheck::revdep_details(, "rsi")` for more info

</details>

## Newly fixed

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 50 lines of output:
      > library(testthat)
      > library(rsi)
      > 
      > test_check("rsi")
      Starting 2 test processes.
      Saving _problems/test-filters-6.R
    ...
       2. │ └─base::withCallingHandlers(...)
       3. └─rsi::spectral_indices(update_cache = FALSE)
       4.   ├─tibble::as_tibble(readRDS(indices_path))
       5.   └─base::readRDS(indices_path)
       6.     └─base::gzfile(file, "rb")
      
      [ FAIL 1 | WARN 1 | SKIP 51 | PASS 29 ]
      Error:
      ! Test failures.
      Execution halted
    ```

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘calculate_indices.Rd’ ‘get_stac_data.R’ ‘get_stac_data.Rd’
        ‘landsat_mask_function.Rd’
    ```

# stppSim

<details>

* Version: 1.3.4
* GitHub: https://github.com/Manalytics/stppSim
* Source code: https://github.com/cran/stppSim
* Date/Publication: 2024-07-24 13:30:02 UTC
* Number of recursive dependencies: 129

Run `revdepcheck::revdep_details(, "stppSim")` for more info

</details>

## In both

*   checking whether package ‘stppSim’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/scratch/henrik/revdep/progressr/checks/stppSim/new/stppSim.Rcheck/00install.out’ for details.
    ```

# tsdistributions

<details>

* Version: 1.0.3
* GitHub: https://github.com/tsmodels/tsdistributions
* Source code: https://github.com/cran/tsdistributions
* Date/Publication: 2025-04-17 09:50:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::revdep_details(, "tsdistributions")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘estimation_demo.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    --- finished re-building ‘estimation_demo.Rmd’
    
    --- re-building ‘location_scale_distributions.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    ! Undefined control sequence.
    l.56 \NewDocumentCommand
                            \citeproctext{}{} 
    ...
    
    --- re-building ‘spd_demo.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    --- finished re-building ‘spd_demo.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘location_scale_distributions.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tsgarch

<details>

* Version: 1.0.3
* GitHub: https://github.com/tsmodels/tsgarch
* Source code: https://github.com/cran/tsgarch
* Date/Publication: 2024-10-12 00:50:02 UTC
* Number of recursive dependencies: 104

Run `revdepcheck::revdep_details(, "tsgarch")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘benchmark.R’ ‘print.R’
    ```

# vmeasur

<details>

* Version: 0.1.4
* GitHub: NA
* Source code: https://github.com/cran/vmeasur
* Date/Publication: 2021-11-11 19:00:02 UTC
* Number of recursive dependencies: 122

Run `revdepcheck::revdep_details(, "vmeasur")` for more info

</details>

## In both

*   checking whether package ‘vmeasur’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/scratch/henrik/revdep/progressr/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
    ```

# WeightedCluster

<details>

* Version: 2.0
* GitHub: NA
* Source code: https://github.com/cran/WeightedCluster
* Date/Publication: 2025-12-10 08:40:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::revdep_details(, "WeightedCluster")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘BigDataSA.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    --- finished re-building ‘BigDataSA.Rmd’
    
    --- re-building ‘ClusterExternalValidSA.Rmd’ using rmarkdown
    [WARNING] Deprecated: --highlight-style. Use --syntax-highlighting instead.
    --- finished re-building ‘ClusterExternalValidSA.Rmd’
    
    --- re-building ‘ClusterValidSA.Rmd’ using rmarkdown
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

