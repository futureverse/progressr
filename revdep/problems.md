# adestr (1.0.0)

* Email: <mailto:meis@imbi.uni-heidelberg.de>
* GitHub mirror: <https://github.com/cran/adestr>

Run `revdepcheck::revdep_details(, "adestr")` for more info

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

# AlpsNMR (4.14.0)

* GitHub: <https://github.com/sipss/AlpsNMR>
* Email: <mailto:sergioller@gmail.com>

Run `revdepcheck::revdep_details(, "AlpsNMR")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /wynton/home/cbi/hb/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /wynton/home/cbi/hb/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     Warning: LaTeX Warning: You have requested package `/scratch/hb/revdep/progressr/library/AlpsNMR/BiocStyle/resources/tex/Bioconductor',
     Warning:                but the package provides `Bioconductor'.
     --- finished re-building ‘Vig01-introduction-to-alpsnmr.Rmd’
     
     --- re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’ using rmarkdown
     Warning: LaTeX Warning: You have requested package `/scratch/hb/revdep/progressr/library/AlpsNMR/BiocStyle/resources/tex/Bioconductor',
     Warning:                but the package provides `Bioconductor'.
     --- finished re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’
     
     --- re-building ‘Vig02-handling-metadata-and-annotations.Rmd’ using rmarkdown
     ! LaTeX Error: No counter 'none' defined.
     
     Error: processing vignette 'Vig02-handling-metadata-and-annotations.Rmd' failed with diagnostics:
     LaTeX failed to compile /scratch/hb/revdep/progressr/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig02-handling-metadata-and-annotations.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Vig02-handling-metadata-and-annotations.log for more info.
     --- failed re-building ‘Vig02-handling-metadata-and-annotations.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Vig02-handling-metadata-and-annotations.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# baseballr (1.6.0)

* GitHub: <https://github.com/BillPetti/baseballr>
* Email: <mailto:saiem.gilani@gmail.com>
* GitHub mirror: <https://github.com/cran/baseballr>

Run `revdepcheck::revdep_details(, "baseballr")` for more info

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘chadwick_installation.R’
     ```

# baskexact (1.0.1)

* GitHub: <https://github.com/lbau7/baskexact>
* Email: <mailto:baumann@imbi.uni-heidelberg.de>
* GitHub mirror: <https://github.com/cran/baskexact>

Run `revdepcheck::revdep_details(, "baskexact")` for more info

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘ggplot2’
       All declared Imports should be used.
     ```

# beer (1.15.1)

* GitHub: <https://github.com/athchen/beer>
* Email: <mailto:achen70@jhu.edu>

Run `revdepcheck::revdep_details(, "beer")` for more info

## In both

*   checking tests ...
     ```
     ...
       calcNormFactors has been renamed to normLibSizes
       
       calcNormFactors has been renamed to normLibSizes
       
       calcNormFactors has been renamed to normLibSizes
       
       calcNormFactors has been renamed to normLibSizes
       
       
       -- Summarizing results ---------------------------------------------------------
       [ FAIL 1 | WARN 0 | SKIP 4 | PASS 68 ]
       
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • On CRAN (4): 'test-edgeR.R:44:1', 'test-guessInits.R:3:1',
         'test-plotHelpers.R:3:1', 'test-plotHelpers.R:44:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-getAB.R:6:5'): Valid beta parameter estimates are derived from PhIPData objects ──
       Expected `getAB(sim_data, "edgeR")` to run silently.
       Actual noise: messages.
       
       [ FAIL 1 | WARN 0 | SKIP 4 | PASS 68 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# caretSDM (1.8.3)

* GitHub: <https://github.com/luizesser/caretSDM>
* Email: <mailto:luizesser@gmail.com>
* GitHub mirror: <https://github.com/cran/caretSDM>

Run `revdepcheck::revdep_details(, "caretSDM")` for more info

## In both

*   checking examples ... ERROR
     ```
     ...
     Warning in CPL_write_gdal(mat, file, driver, options, type, dims, from,  :
       GDAL Error 1: PROJ: proj_as_wkt: DatumEnsemble can only be exported to WKT2:2019
     Warning in CPL_write_gdal(mat, file, driver, options, type, dims, from,  :
       GDAL Error 1: PROJ: proj_as_wkt: DatumEnsemble can only be exported to WKT2:2019
     Warning in CPL_gdalwarp(source, destination, options, oo, doo, config_options,  :
       GDAL Error 1: Cannot compute bounding box of cutline. Cannot find source SRS
     Error in `value[[3L]]()`:
     ✖ GDAL warp failed.
     In index: 1.
     Backtrace:
          ▆
       1. ├─caretSDM::add_predictors(sa, bioc)
       2. └─caretSDM:::add_predictors.stars(sa, bioc) at caretSDM/R/add_predictors.R:83:3
       3.   └─caretSDM:::.add_predictors(...) at caretSDM/R/add_predictors.R:109:3
       4.     ├─caretSDM::sdm_area(...) at caretSDM/R/add_predictors.R:123:3
       5.     └─caretSDM:::sdm_area.stars(...) at caretSDM/R/sdm_area.R:126:3
       6.       ├─dplyr::select(...) at caretSDM/R/sdm_area.R:288:5
       7.       └─caretSDM:::.sdm_area_from_stars_using_gdal(...) at caretSDM/R/sdm_area.R:288:5
       8.         └─base::tryCatch(...) at caretSDM/R/sdm_area.R:530:3
       9.           └─base (local) tryCatchList(expr, classes, parentenv, handlers)
      10.             └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
      11.               └─value[[3L]](cond)
      12.                 └─cli::cli_abort(c(x = "GDAL warp failed.", i = e$message)) at caretSDM/R/sdm_area.R:579:7
      13.                   └─rlang::abort(...)
     Execution halted
     ```

*   checking tests ...
     ```
     ...
         9.             └─cli::cli_abort(c(x = "GDAL warp failed.", i = e$message)) at caretSDM/R/sdm_area.R:579:7
        10.               └─rlang::abort(...)
       ── Error ('test-train_sdm.R:4:3'): (code run outside of `test_that()`) ─────────
       Error in `value[[3L]](cond)`: x GDAL warp failed.
       In index: 1.
       Backtrace:
            ▆
         1. ├─caretSDM::add_predictors(sa, bioc) at test-train_sdm.R:4:3
         2. └─caretSDM:::add_predictors.stars(sa, bioc) at caretSDM/R/add_predictors.R:83:3
         3.   └─caretSDM:::.add_predictors(...) at caretSDM/R/add_predictors.R:109:3
         4.     ├─caretSDM::sdm_area(...) at caretSDM/R/add_predictors.R:123:3
         5.     └─caretSDM:::sdm_area.stars(...) at caretSDM/R/sdm_area.R:126:3
         6.       ├─dplyr::select(...) at caretSDM/R/sdm_area.R:288:5
         7.       └─caretSDM:::.sdm_area_from_stars_using_gdal(...) at caretSDM/R/sdm_area.R:288:5
         8.         └─base::tryCatch(...) at caretSDM/R/sdm_area.R:530:3
         9.           └─base (local) tryCatchList(expr, classes, parentenv, handlers)
        10.             └─base (local) tryCatchOne(expr, names, parentenv, handlers[[1L]])
        11.               └─value[[3L]](cond)
        12.                 └─cli::cli_abort(c(x = "GDAL warp failed.", i = e$message)) at caretSDM/R/sdm_area.R:579:7
        13.                   └─rlang::abort(...)
       
       [ FAIL 18 | WARN 68 | SKIP 74 | PASS 305 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# CrcBiomeScreen (1.0.0)

* GitHub: <https://github.com/omicsForestry/CrcBiomeScreen>
* Email: <mailto:ngzh5554@leeds.ac.uk>

Run `revdepcheck::revdep_details(, "CrcBiomeScreen")` for more info

## In both

*   checking for non-standard things in the check directory ... NOTE
     ```
     Found the following files/directories:
       ‘roc.curve.rf.RF_TSS_toydata_Validation.pdf’
     ```

# crumble (0.1.2)

* Email: <mailto:ntwilliams.personal@gmail.com>
* GitHub mirror: <https://github.com/cran/crumble>

Run `revdepcheck::revdep_details(, "crumble")` for more info

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.2.0 because package code uses the pipe
       placeholder syntax added in R 4.2.0.
       File(s) using such syntax:
         ‘helpers.R’
     ```

# cSEM (0.6.1)

* GitHub: <https://github.com/FloSchuberth/cSEM>
* Email: <mailto:f.schuberth@utwente.nl>
* GitHub mirror: <https://github.com/cran/cSEM>

Run `revdepcheck::revdep_details(, "cSEM")` for more info

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘Rdpack’
       All declared Imports should be used.
     ```

# econet (1.0.0.1)

* Email: <mailto:valerio.leonesciabolazza@uniroma1.it>
* GitHub mirror: <https://github.com/cran/econet>

Run `revdepcheck::revdep_details(, "econet")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘econet.tex’ using tex
     Error: processing vignette 'econet.tex' failed with diagnostics:
     Running 'texi2dvi' on 'econet.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `multirow.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.5 \graphicspath
                      {{Figures/}}^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘econet.tex’
     
     SUMMARY: processing the following file failed:
       ‘econet.tex’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# EFAtools (0.7.1)

* GitHub: <https://github.com/mdsteiner/EFAtools>
* Email: <mailto:markus.d.steiner@gmail.com>
* GitHub mirror: <https://github.com/cran/EFAtools>

Run `revdepcheck::revdep_details(, "EFAtools")` for more info

## In both

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Complete output:
       > library(testthat)
       > library(EFAtools)
       > 
       > test_check("EFAtools")
       Saving _problems/test-PROCRUSTES-24.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 2285 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-PROCRUSTES.R:20:3'): PROCRUSTES matches psych::Procrustes and GPArotation::targetQ outputs ──
       Expected `GPArotation::targetQ(unrot_loadings[[2]], Target = rot_loadings[[1]])$loadings` to be equivalent to `PROCRUSTES(unrot_loadings[[2]], rot_loadings[[1]], rotation = "oblique")$loadings`.
       target is loadings, current is matrix
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 2285 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘progress’
       All declared Imports should be used.
     ```

# fastRhockey (0.4.0)

* GitHub: <https://github.com/sportsdataverse/fastRhockey>
* Email: <mailto:saiem.gilani@gmail.com>
* GitHub mirror: <https://github.com/cran/fastRhockey>

Run `revdepcheck::revdep_details(, "fastRhockey")` for more info

## In both

*   checking Rd files ... NOTE
     ```
     checkRd: (-1) update_nhl_db.Rd:51-53: Lost braces in \itemize; meant \describe ?
     checkRd: (-1) update_nhl_db.Rd:54-57: Lost braces in \itemize; meant \describe ?
     checkRd: (-1) update_phf_db.Rd:51-53: Lost braces in \itemize; meant \describe ?
     checkRd: (-1) update_phf_db.Rd:54-57: Lost braces in \itemize; meant \describe ?
     ```

# geocmeans (0.3.4)

* GitHub: <https://github.com/JeremyGelb/geocmeans>
* Email: <mailto:jeremy.gelb@ucs.inrs.ca>
* GitHub mirror: <https://github.com/cran/geocmeans>

Run `revdepcheck::revdep_details(, "geocmeans")` for more info

## In both

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     ! method not available for GDAL: 3.0.4
     ---
     Backtrace:
          ▆
       1. ├─base::withVisible(knit_print(x, ...))
       2. ├─knitr::knit_print(x, ...)
       3. └─tmap:::knit_print.tmap(x, ...)
       4.   └─tmap:::print.tmap(x, knit = TRUE, options = options, ...)
       5.     └─tmap:::step4_plot(...)
       6.       ├─base::do.call(tmaptools::bb, c(list(x = full_bbox(crs)), bbo_args))
       7.       └─tmap:::full_bbox(crs)
       8.         ├─sf::st_bbox(sf::st_transform(sf::st_bbox(), crs = crs))
       9.         ├─sf::st_transform(sf::st_bbox(), crs = crs)
      10.         └─sf:::st_transform.bbox(sf::st_bbox(), crs = crs)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'introduction.Rmd' failed with diagnostics:
     method not available for GDAL: 3.0.4
     --- failed re-building ‘introduction.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘introduction.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# gtfs2gps (2.1-4)

* GitHub: <https://github.com/ipeaGIT/gtfs2gps>
* Email: <mailto:pedro.andrade@inpe.br>
* GitHub mirror: <https://github.com/cran/gtfs2gps>

Run `revdepcheck::revdep_details(, "gtfs2gps")` for more info

## In both

*   checking tests ...
     ```
     ...
       
       > 
       > test_check("gtfs2gps")
       Saving _problems/test_simplify_shapes-7.R
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 119 ]
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_simplify_shapes.R:7:5'): simplify_shapes ───────────────────────
       Error: [] make_valid is not available for GEOS < 3.8
       Backtrace:
           ▆
        1. └─gtfs2gps:::simplify_shapes(poa, 1e-05) at test_simplify_shapes.R:7:5
        2.   ├─terra::simplifyGeom(x = gtfs_st_simpl, tolerance = tol) at gtfs2gps/R/simplify_shapes.R:20:3
        3.   └─terra::simplifyGeom(x = gtfs_st_simpl, tolerance = tol)
        4.     └─terra (local) .local(x, ...)
        5.       ├─terra::makeValid(x)
        6.       └─terra::makeValid(x)
        7.         └─terra (local) .local(x, ...)
        8.           └─terra:::messages(x)
        9.             └─terra:::error(f, x@pntr$getError())
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 119 ]
       Error:
       ! Test failures.
       Execution halted
     ```

# ISAnalytics (1.22.0)

* GitHub: <https://github.com/calabrialab/ISAnalytics>
* Email: <mailto:gazzo.francesco@hsr.it>

Run `revdepcheck::revdep_details(, "ISAnalytics")` for more info

## In both

*   checking tests ...
     ```
     ...
         1. ├─testthat::expect_error(...) at test-utility-functions.R:802:5
         2. │ └─testthat:::expect_condition_matching_(...)
         3. │   └─testthat:::quasi_capture(...)
         4. │     ├─testthat (local) .capture(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         7. ├─ISAnalytics:::.execute_map_job(...) at test-utility-functions.R:803:9
         8. │ └─future::plan(old_plan) at ISAnalytics/R/internal-functions.R:927:17
         9. │   └─future::plan(...)
        10. │     └─future (local) plan_set(...)
        11. │       └─future:::plan_init(stack[[1]], debug = debug)
        12. │         └─future:::makeFutureBackend(evaluator, debug = debug)
        13. │           └─base::do.call(factory, args = args, envir = envir)
        14. └─future (local) `<fn>`(workers = 10L)
        15.   └─future::ClusterFutureBackend(...)
        16.     └─clusterRegistry$startCluster(...)
        17.       └─future (local) makeCluster(workers, ...)
        18.         ├─base::do.call(makeClusterPSOCK, args = args, quote = TRUE)
        19.         └─parallelly (local) `<fn>`(base::quote(10L), rscript_libs = base::quote(`<chr>`))
        20.           └─parallelly:::checkNumberOfLocalWorkers(workers)
       
       [ FAIL 14 | WARN 8 | SKIP 0 | PASS 797 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       2. │ └─ISAnalytics:::.process_collisions(...) at ISAnalytics/R/collision-removal.R:187:5
       3. │   └─ISAnalytics:::.execute_map_job(...) at ISAnalytics/R/internal-functions.R:3085:5
       4. │     └─future::plan(future::multisession, workers = max_workers) at ISAnalytics/R/internal-functions.R:924:9
       5. │       └─future (local) plan_set(...)
       6. │         └─future:::plan_init(stack[[1]], debug = debug)
       7. │           └─future:::makeFutureBackend(evaluator, debug = debug)
       8. │             └─base::do.call(factory, args = args, envir = envir)
       9. └─future (local) `<fn>`(workers = 10L)
      10.   └─future::ClusterFutureBackend(...)
      11.     └─clusterRegistry$startCluster(...)
      12.       └─future (local) makeCluster(workers, ...)
      13.         ├─base::do.call(makeClusterPSOCK, args = args, quote = TRUE)
      14.         └─parallelly (local) `<fn>`(base::quote(10L), rscript_libs = base::quote(`<chr>`))
      15.           └─parallelly:::checkNumberOfLocalWorkers(workers)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'workflow_start.Rmd' failed with diagnostics:
     Attempting to set up 10 localhost parallel workers with only 2 CPU cores available for this R process (per 'SGE'), which could result in a 500% load. The hard limit is set to 300%. Overusing the CPUs has negative impact on the current R process, but also on all other processes of yours and others running on the same machine. See help("parallelly.maxWorkers.localhost", package = "parallelly") for further explanations and how to override the hard limit that triggered this error
     --- failed re-building ‘workflow_start.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘workflow_start.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# mapme.biodiversity (0.9.6)

* GitHub: <https://github.com/mapme-initiative/mapme.biodiversity>
* Email: <mailto:zivan.karaman@gmail.com>
* GitHub mirror: <https://github.com/cran/mapme.biodiversity>

Run `revdepcheck::revdep_details(, "mapme.biodiversity")` for more info

## In both

*   checking tests ...
     ```
     ...
                            (right here) ------^
       Backtrace:
            ▆
         1. ├─mapme.biodiversity::make_footprints(tifs, what = "raster") at test-get_resources.R:72:3
         2. │ └─purrr::map2(srcs, oo, function(src, opt) .raster_footprint(src, opt)) at mapme.biodiversity/R/spatial-utils.R:146:5
         3. │   └─purrr:::map2_("list", .x, .y, .f, ..., .progress = .progress)
         4. │     ├─purrr:::with_indexed_errors(...)
         5. │     │ └─base::withCallingHandlers(...)
         6. │     ├─purrr:::call_with_cleanup(...)
         7. │     └─mapme.biodiversity (local) .f(.x[[i]], .y[[i]], ...)
         8. │       └─mapme.biodiversity:::.raster_footprint(src, opt) at mapme.biodiversity/R/spatial-utils.R:146:5
         9. │         └─mapme.biodiversity:::.raster_info(src, oo) at mapme.biodiversity/R/spatial-utils.R:291:3
        10. │           └─jsonlite::parse_json(info) at mapme.biodiversity/R/spatial-utils.R:315:3
        11. │             └─jsonlite:::parse_and_simplify(...)
        12. │               └─jsonlite:::parseJSON(txt, bigint_as_char)
        13. │                 └─jsonlite:::parse_string(txt, bigint_as_char)
        14. └─base::.handleSimpleError(...)
        15.   └─purrr (local) h(simpleError(msg, call))
        16.     └─cli::cli_abort(...)
        17.       └─rlang::abort(...)
       
       [ FAIL 2 | WARN 0 | SKIP 44 | PASS 526 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking whether package ‘mapme.biodiversity’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: GDAL system library version (3.0.4) < 3.7.0
     See ‘/scratch/hb/revdep/progressr/checks/mapme.biodiversity/new/mapme.biodiversity.Rcheck/00install.out’ for details.
     ```

*   checking whether the namespace can be loaded with stated dependencies ... NOTE
     ```
     Warning: GDAL system library version (3.0.4) < 3.7.0
     
     A namespace must be able to be loaded with just the base namespace
     loaded: otherwise if the namespace gets loaded by a saved object, the
     session will be unable to start.
     
     Probably some imports need to be declared in the NAMESPACE file.
     ```

# mikropml (1.7.0)

* GitHub: <https://github.com/SchlossLab/mikropml>
* Email: <mailto:sovacool@umich.edu>
* GitHub mirror: <https://github.com/cran/mikropml>

Run `revdepcheck::revdep_details(, "mikropml")` for more info

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘methods’
       All declared Imports should be used.
     ```

# pavo (2.9.0)

* GitHub: <https://github.com/rmaia/pavo>
* Email: <mailto:thomas.white026@gmail.com>
* GitHub mirror: <https://github.com/cran/pavo>

Run `revdepcheck::revdep_details(, "pavo")` for more info

## In both

*   checking whether package ‘pavo’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: no DISPLAY variable so Tk is not available
     See ‘/scratch/hb/revdep/progressr/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
     ```

# poppr (2.9.8)

* GitHub: <https://github.com/grunwaldlab/poppr>
* Email: <mailto:zkamvar@gmail.com>
* GitHub mirror: <https://github.com/cran/poppr>

Run `revdepcheck::revdep_details(, "poppr")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘algo.Rnw’ using knitr
     Error: processing vignette 'algo.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'algo.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `colortbl.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.4 \makeatletter
                      ^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘algo.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘algo.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# powRICLPM (0.2.1)

* GitHub: <https://github.com/JeroenDMulder/powRICLPM>
* Email: <mailto:j.d.mulder@uu.nl>
* GitHub mirror: <https://github.com/cran/powRICLPM>

Run `revdepcheck::revdep_details(, "powRICLPM")` for more info

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘save.R’
     ```

# PWIR (0.0.3.1)

* Email: <mailto:R.Haunschild@fkf.mpg.de>
* GitHub mirror: <https://github.com/cran/PWIR>

Run `revdepcheck::revdep_details(, "PWIR")` for more info

## In both

*   checking dependencies in R code ... NOTE
     ```
     Namespace in Imports field not imported from: ‘progressr’
       All declared Imports should be used.
     ```

# remiod (1.0.2)

* GitHub: <https://github.com/xsswang/remiod>
* Email: <mailto:xwang@imedacs.com>
* GitHub mirror: <https://github.com/cran/remiod>

Run `revdepcheck::revdep_details(, "remiod")` for more info

## In both

*   checking S3 generic/method consistency ... NOTE
     ```
     Mismatches for apparent methods not registered:
     rep:
       function(x, ...)
     rep.data.frame:
       function(x, times)
     See section ‘Registering S3 methods’ in the ‘Writing R Extensions’
     manual.
     ```

# seqHMM (2.2.0)

* GitHub: <https://github.com/helske/seqHMM>
* Email: <mailto:jouni.helske@iki.fi>
* GitHub mirror: <https://github.com/cran/seqHMM>

Run `revdepcheck::revdep_details(, "seqHMM")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     LaTeX errors:
     ! LaTeX Error: File `grfext.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.179   \RequirePackage{grfext}\relax
                                          ^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘seqHMM_algorithms.Rnw’
     
     --- re-building ‘seqHMM_estimation.Rnw’ using knitr
     --- finished re-building ‘seqHMM_estimation.Rnw’
     
     --- re-building ‘seqHMM_visualization.Rnw’ using knitr
     --- finished re-building ‘seqHMM_visualization.Rnw’
     
     SUMMARY: processing the following file failed:
       ‘seqHMM_algorithms.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# stppSim (1.3.4)

* GitHub: <https://github.com/Manalytics/stppSim>
* Email: <mailto:monsuur2010@yahoo.com>
* GitHub mirror: <https://github.com/cran/stppSim>

Run `revdepcheck::revdep_details(, "stppSim")` for more info

## In both

*   checking whether package ‘stppSim’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: no DISPLAY variable so Tk is not available
     See ‘/scratch/hb/revdep/progressr/checks/stppSim/new/stppSim.Rcheck/00install.out’ for details.
     ```

# vmeasur (0.1.4)

* Email: <mailto:jhuc964@aucklanduni.ac.nz>
* GitHub mirror: <https://github.com/cran/vmeasur>

Run `revdepcheck::revdep_details(, "vmeasur")` for more info

## In both

*   checking whether package ‘vmeasur’ can be installed ... WARNING
     ```
     Found the following significant warnings:
       Warning: no DISPLAY variable so Tk is not available
     See ‘/scratch/hb/revdep/progressr/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
     ```

# WeightedCluster (2.0)

* Email: <mailto:matthias.studer@unige.ch>
* GitHub mirror: <https://github.com/cran/WeightedCluster>

Run `revdepcheck::revdep_details(, "WeightedCluster")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     --- failed re-building ‘WeightedClusterFR.Rnw’
     
     --- re-building ‘WeightedClusterPreview.Rnw’ using knitr
     Error: processing vignette 'WeightedClusterPreview.Rnw' failed with diagnostics:
     Running 'texi2dvi' on 'WeightedClusterPreview.tex' failed.
     LaTeX errors:
     ! LaTeX Error: File `a4.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.66 \usepackage
                     {ae}^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘WeightedClusterPreview.Rnw’
     
     SUMMARY: processing the following files failed:
       ‘WeightedCluster.Rnw’ ‘WeightedClusterFR.Rnw’
       ‘WeightedClusterPreview.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

