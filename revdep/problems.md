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
* Number of recursive dependencies: 74

Run `revdepcheck::revdep_details(, "baskexact")` for more info

</details>

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘ggplot2’
      All declared Imports should be used.
    ```

# beer

<details>

* Version: 1.14.0
* GitHub: https://github.com/athchen/beer
* Source code: https://github.com/cran/beer
* Date/Publication: 2025-10-29
* Number of recursive dependencies: 121

Run `revdepcheck::revdep_details(, "beer")` for more info

</details>

## Newly broken

*   checking whether package ‘beer’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/scratch/henrik/revdep/progressr/checks/beer/new/beer.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘beer’ ...
** this is package ‘beer’ version ‘1.14.0’
** package ‘beer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error: object ‘progress’ is not exported by 'namespace:progressr'
Execution halted
ERROR: lazy loading failed for package ‘beer’
* removing ‘/scratch/henrik/revdep/progressr/checks/beer/new/beer.Rcheck/beer’


```
### CRAN

```
* installing *source* package ‘beer’ ...
** this is package ‘beer’ version ‘1.14.0’
** package ‘beer’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (beer)


```
# caretSDM

<details>

* Version: 1.1.4
* GitHub: https://github.com/luizesser/caretSDM
* Source code: https://github.com/cran/caretSDM
* Date/Publication: 2025-08-29 13:50:02 UTC
* Number of recursive dependencies: 184

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
* Number of recursive dependencies: 144

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
* Number of recursive dependencies: 63

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
* Number of recursive dependencies: 126

Run `revdepcheck::revdep_details(, "fdacluster")` for more info

</details>

## In both

*   checking whether package ‘fdacluster’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      baseDissimilarityClass.cpp:39:28: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
      baseDissimilarityClass.cpp:39:57: warning: ‘bool arma::is_finite(const Base<typename T1::elem_type, T1>&) [with T1 = subview<double>; typename T1::elem_type = double]’ is deprecated: change arma::is_finite(X) to X.is_finite() [-Wdeprecated-declarations]
      baseDissimilarityClass.cpp:53:28: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
      baseDissimilarityClass.cpp:53:57: warning: ‘bool arma::is_finite(const Base<typename T1::elem_type, T1>&) [with T1 = subview<double>; typename T1::elem_type = double]’ is deprecated: change arma::is_finite(X) to X.is_finite() [-Wdeprecated-declarations]
      lowessCenterClass.cpp:41:28: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
      lowessCenterClass.cpp:41:64: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
      polyCenterClass.cpp:39:28: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
      polyCenterClass.cpp:39:64: warning: ‘bool arma::is_finite(eT, const typename arma_scalar_only<eT>::result*) [with eT = double; typename arma_scalar_only<eT>::result = double]’ is deprecated: change arma::is_finite(val) to std::isfinite(val) [-Wdeprecated-declarations]
    See ‘/scratch/henrik/revdep/progressr/checks/fdacluster/new/fdacluster.Rcheck/00install.out’ for details.
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
      Missing dependency on R >= 4.2.0 because package code uses the pipe
      placeholder syntax added in R 4.2.0.
      File(s) using such syntax:
        ‘caps-plot.R’ ‘utils.R’
    ```

# futureverse

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/futureverse
* Date/Publication: 2024-06-07 14:10:22 UTC
* Number of recursive dependencies: 43

Run `revdepcheck::revdep_details(, "futureverse")` for more info

</details>

## Newly broken

*   checking dependencies in R code ... WARNING
    ```
    Missing or unexported object: ‘progressr::progress’
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
    Complete output:
      > library(testthat)
      > library(mapme.biodiversity)
      > 
      > options(pillar.advice = FALSE)
      > mapme_options(verbose = FALSE)
      > test_check("mapme.biodiversity")
    ...
      `x2 <- .split_dateline(x)` produced warnings.
      ── Failure ('test-chunking.R:8:3'): .crosses_dateline and .split_dateline works ──
      nrow(x2) (`actual`) not equal to 2 (`expected`).
      
        `actual`: 1.0
      `expected`: 2.0
      
      [ FAIL 2 | WARN 0 | SKIP 43 | PASS 532 ]
      Error: Test failures
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

# mpathsenser

<details>

* Version: 1.2.3
* GitHub: NA
* Source code: https://github.com/cran/mpathsenser
* Date/Publication: 2024-03-29 16:00:02 UTC
* Number of recursive dependencies: 107

Run `revdepcheck::revdep_details(, "mpathsenser")` for more info

</details>

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link(s) in Rd file 'fix_jsons.Rd':
      ‘[progressr:progress]{progressr::progress()}’
    
    Missing link(s) in Rd file 'import.Rd':
      ‘[progressr:progress]{progressr::progress()}’
    
    Missing link(s) in Rd file 'test_jsons.Rd':
      ‘[progressr:progress]{progressr::progress()}’
    
    Missing link(s) in Rd file 'unzip_data.Rd':
      ‘[progressr:progress]{progressr::progress()}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

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
    See ‘/scratch/henrik/revdep/progressr/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
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
* Number of recursive dependencies: 108

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
    See ‘/scratch/henrik/revdep/progressr/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
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

