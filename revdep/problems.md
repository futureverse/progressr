# adestr

<details>

* Version: 1.0.0
* GitHub: NA
* Source code: https://github.com/cran/adestr
* Date/Publication: 2024-07-12 13:50:09 UTC
* Number of recursive dependencies: 122

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

* Version: 4.10.0
* GitHub: https://github.com/sipss/AlpsNMR
* Source code: https://github.com/cran/AlpsNMR
* Date/Publication: 2025-04-15
* Number of recursive dependencies: 180

Run `revdepcheck::revdep_details(, "AlpsNMR")` for more info

</details>

## In both

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(AlpsNMR)
      
      Attaching package: 'AlpsNMR'
      
      The following object is masked from 'package:stats':
    ...
      `expected`: TRUE 
      ── Failure ('test-outliers.R:30:5'): nmr_pca_outliers_robust works ─────────────
      is.list(plot) is not TRUE
      
      `actual`:   FALSE
      `expected`: TRUE 
      
      [ FAIL 5 | WARN 0 | SKIP 1 | PASS 88 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘Vig01-introduction-to-alpsnmr.Rmd’ using rmarkdown
    
    Quitting from Vig01-introduction-to-alpsnmr.Rmd:94-99 [load-samples]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `socketConnection()`:
    ! cannot open the connection
    ---
    Backtrace:
    ...
    LaTeX failed to compile /c4/home/henrik/futureverse/progressr/revdep/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig02-handling-metadata-and-annotations.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips.
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
* Number of recursive dependencies: 74

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
* Number of recursive dependencies: 160

Run `revdepcheck::revdep_details(, "bayesmove")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) insert_NAs.Rd:22: Lost braces; missing escapes or markup?
        22 | A data frame where new rows have been inserted to regularize the \code{date} column. This results in values provided for \code{id}, \code{date}, and {dt} while inserting NAs for all other columns. Additionally, observations with duplicate date-times are removed.
           |                                                                                                                                                      ^
    ```

# bolasso

<details>

* Version: 0.3.0
* GitHub: https://github.com/dmolitor/bolasso
* Source code: https://github.com/cran/bolasso
* Date/Publication: 2024-12-08 22:20:12 UTC
* Number of recursive dependencies: 67

Run `revdepcheck::revdep_details(, "bolasso")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘plot.R’ ‘utils.R’
    ```

# caretSDM

<details>

* Version: 1.1.4
* GitHub: https://github.com/luizesser/caretSDM
* Source code: https://github.com/cran/caretSDM
* Date/Publication: 2025-08-29 13:50:02 UTC
* Number of recursive dependencies: 183

Run `revdepcheck::revdep_details(, "caretSDM")` for more info

</details>

## In both

*   checking examples ... ERROR
    ```
    Running examples in ‘caretSDM-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_scenarios
    > ### Title: Add scenarios to 'sdm_area'
    > ### Aliases: add_scenarios set_scenarios_names scenarios_names
    > ###   get_scenarios_data select_scenarios
    > 
    > ### ** Examples
    > 
    ...
    Backtrace:
        ▆
     1. ├─caretSDM::select_predictors(...)
     2. │ └─dplyr::select(x, ...)
     3. ├─caretSDM::add_scenarios(sa, scen[1:2])
     4. └─caretSDM:::add_scenarios.stars(sa, scen[1:2])
     5.   └─caretSDM::set_variables_names(scen, sa)
     6.     └─cli::cli_abort(...)
     7.       └─rlang::abort(...)
    Execution halted
    ```

*   checking tests ...
    ```
      Running ‘testthat.R’
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 50 lines of output:
        9. │         │ └─base::withCallingHandlers(...)
       10. │         └─tidyselect:::vars_select_eval(...)
       11. │           └─tidyselect:::walk_data_tree(expr, data_mask, context_mask)
       12. │             └─tidyselect:::eval_c(expr, data_mask, context_mask)
       13. │               └─tidyselect:::reduce_sels(node, data_mask, context_mask, init = init)
       14. │                 └─tidyselect:::walk_data_tree(new, data_mask, context_mask)
    ...
       20. │                             └─tidyselect:::chr_as_locations(x, vars, call = call, arg = arg)
       21. │                               └─vctrs::vec_as_location(...)
       22. └─vctrs (local) `<fn>`()
       23.   └─vctrs:::stop_subscript_oob(...)
       24.     └─vctrs:::stop_subscript(...)
       25.       └─rlang::abort(...)
      
      [ FAIL 41 | WARN 180 | SKIP 30 | PASS 475 ]
      Error: Test failures
      Execution halted
    ```

# collinear

<details>

* Version: 2.0.0
* GitHub: https://github.com/blasbenito/collinear
* Source code: https://github.com/cran/collinear
* Date/Publication: 2024-11-08 13:50:02 UTC
* Number of recursive dependencies: 47

Run `revdepcheck::revdep_details(, "collinear")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘collinear.R’ ‘cor_cramer_v.R’ ‘cor_df.R’ ‘cor_select.R’ ‘f_auc.Rd’
        ‘f_r2.Rd’ ‘f_r2_counts.Rd’ ‘f_v.Rd’ ‘f_v_rf_categorical.Rd’
        ‘identify.R’ ‘model_formula.R’ ‘preference_order.R’
        ‘preference_order_methods.R’ ‘target_encoding_methods.R’ ‘validate.R’
        ‘vif_df.R’ ‘vif_select.R’
    ```

# crumble

<details>

* Version: 0.1.2
* GitHub: NA
* Source code: https://github.com/cran/crumble
* Date/Publication: 2024-12-02 17:50:02 UTC
* Number of recursive dependencies: 128

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
* Number of recursive dependencies: 143

Run `revdepcheck::revdep_details(, "cSEM")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘Rdpack’
      All declared Imports should be used.
    ```

# dipsaus

<details>

* Version: 0.3.1
* GitHub: https://github.com/dipterix/dipsaus
* Source code: https://github.com/cran/dipsaus
* Date/Publication: 2025-04-03 16:50:02 UTC
* Number of recursive dependencies: 62

Run `revdepcheck::revdep_details(, "dipsaus")` for more info

</details>

## In both

*   checking compiled code ... NOTE
    ```
    File ‘dipsaus/libs/dipsaus.so’:
      Found non-API call to R: ‘ENCLOS’
    
    Compiled code should not call non-API entry points in R.
    
    See ‘Writing portable packages’ in the ‘Writing R Extensions’ manual,
    and section ‘Moving into C API compliance’ for issues with the use of
    non-API entry points.
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

# fdacluster

<details>

* Version: 0.4.1
* GitHub: https://github.com/astamm/fdacluster
* Source code: https://github.com/cran/fdacluster
* Date/Publication: 2025-01-14 16:50:09 UTC
* Number of recursive dependencies: 125

Run `revdepcheck::revdep_details(, "fdacluster")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.2.0 because package code uses the pipe
      placeholder syntax added in R 4.2.0.
      File(s) using such syntax:
        ‘caps-plot.R’ ‘utils.R’
    ```

# geocmeans

<details>

* Version: 0.3.4
* GitHub: https://github.com/JeremyGelb/geocmeans
* Source code: https://github.com/cran/geocmeans
* Date/Publication: 2023-09-12 03:10:02 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::revdep_details(, "geocmeans")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... ERROR
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘introduction.Rmd’ using rmarkdown
    
    Quitting from introduction.Rmd:487-489 [unnamed-chunk-38]
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    <error/rlang_error>
    Error in `st_transform.bbox()`:
    ! method not available for GDAL: 3.0.4
    ---
    Backtrace:
    ...
    
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    method not available for GDAL: 3.0.4
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
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
       9.             └─terra:::error(f, x@pntr$getError())
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 119 ]
      Error: Test failures
      Execution halted
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘adjust_speed.R’ ‘adjust_speed.Rd’ ‘gps_as_sflinestring.Rd’
        ‘gps_as_sfpoints.Rd’ ‘gtfs2gps.Rd’ ‘write_gtfs.Rd’
    ```

# ISAnalytics

<details>

* Version: 1.18.0
* GitHub: https://github.com/calabrialab/ISAnalytics
* Source code: https://github.com/cran/ISAnalytics
* Date/Publication: 2025-04-15
* Number of recursive dependencies: 176

Run `revdepcheck::revdep_details(, "ISAnalytics")` for more info

</details>

## In both

*   checking Rd files ... NOTE
    ```
    checkRd: (-1) refGenes_hg19.Rd:21: Lost braces; missing escapes or markup?
        21 | \item Download from {http://hgdownload.soe.ucsc.edu/goldenPath/hg19/database/}
           |                     ^
    ```

# lava

<details>

* Version: 1.8.1
* GitHub: https://github.com/kkholst/lava
* Source code: https://github.com/cran/lava
* Date/Publication: 2025-01-12 11:40:02 UTC
* Number of recursive dependencies: 130

Run `revdepcheck::revdep_details(, "lava")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘contr.Rd’
    ```

# mapme.biodiversity

<details>

* Version: 0.9.4
* GitHub: https://github.com/mapme-initiative/mapme.biodiversity
* Source code: https://github.com/cran/mapme.biodiversity
* Date/Publication: 2025-04-28 13:00:08 UTC
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
      
      [ FAIL 5 | WARN 1 | SKIP 38 | PASS 563 ]
      Error: Test failures
      Execution halted
    ```

# mpathsenser

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/mpathsenser
* Date/Publication: 2024-03-29 16:00:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::revdep_details(, "mpathsenser")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘alias_column_names.R’ ‘bin_data.Rd’ ‘coverage.R’ ‘database.R’
        ‘decrypt_gps.Rd’ ‘import.R’ ‘import_functions.R’ ‘linking.R’
        ‘location_functions.R’ ‘sensor_functions.R’
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
    See ‘/c4/home/henrik/futureverse/progressr/revdep/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
    ```

# powRICLPM

<details>

* Version: 0.2.1
* GitHub: https://github.com/JeroenDMulder/powRICLPM
* Source code: https://github.com/cran/powRICLPM
* Date/Publication: 2024-10-26 13:50:03 UTC
* Number of recursive dependencies: 64

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
* Number of recursive dependencies: 107

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
      [ FAIL 1 | WARN 0 | SKIP 4 | PASS 5 ]
      
    ...
       3. │   └─testthat:::quasi_capture(...)
       4. │     ├─testthat (local) .capture(...)
       5. │     │ └─base::withCallingHandlers(...)
       6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       7. └─receptiviti::receptiviti(...)
       8.   └─receptiviti:::manage_request(...)
      
      [ FAIL 1 | WARN 0 | SKIP 4 | PASS 5 ]
      Error: Test failures
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
    See ‘/c4/home/henrik/futureverse/progressr/revdep/checks/stppSim/new/stppSim.Rcheck/00install.out’ for details.
    ```

# targeted

<details>

* Version: 0.5
* GitHub: https://github.com/kkholst/targeted
* Source code: https://github.com/cran/targeted
* Date/Publication: 2024-02-22 10:00:21 UTC
* Number of recursive dependencies: 90

Run `revdepcheck::revdep_details(, "targeted")` for more info

</details>

## In both

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.1.0 because package code uses the pipe
      |> or function shorthand \(...) syntax added in R 4.1.0.
      File(s) using such syntax:
        ‘alean.Rd’ ‘nondom.Rd’
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

# tsgarch

<details>

* Version: 1.0.3
* GitHub: https://github.com/tsmodels/tsgarch
* Source code: https://github.com/cran/tsgarch
* Date/Publication: 2024-10-12 00:50:02 UTC
* Number of recursive dependencies: 94

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
* Number of recursive dependencies: 108

Run `revdepcheck::revdep_details(, "vmeasur")` for more info

</details>

## In both

*   checking whether package ‘vmeasur’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: no DISPLAY variable so Tk is not available
    See ‘/c4/home/henrik/futureverse/progressr/revdep/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
    ```

# WeightedCluster

<details>

* Version: 1.8-1
* GitHub: NA
* Source code: https://github.com/cran/WeightedCluster
* Date/Publication: 2024-12-10 22:00:02 UTC
* Number of recursive dependencies: 72

Run `revdepcheck::revdep_details(, "WeightedCluster")` for more info

</details>

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘BigDataSA.Rmd’ using rmarkdown
    --- finished re-building ‘BigDataSA.Rmd’
    
    --- re-building ‘ClusterExternalValidSA.Rmd’ using rmarkdown
    --- finished re-building ‘ClusterExternalValidSA.Rmd’
    
    --- re-building ‘ClusterValidSA.Rmd’ using rmarkdown
    --- finished re-building ‘ClusterValidSA.Rmd’
    
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

