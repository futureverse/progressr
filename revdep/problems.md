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
     Error(s) in re-building vignettes:
       ...
     --- re-building ‘Vig01-introduction-to-alpsnmr.Rmd’ using rmarkdown
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

# cSEM (0.7.1)

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

# ISAnalytics (1.22.0)

* GitHub: <https://github.com/calabrialab/ISAnalytics>
* Email: <mailto:gazzo.francesco@hsr.it>

Run `revdepcheck::revdep_details(, "ISAnalytics")` for more info

## In both

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
       5. │   │   └─vctrs::obj_check_list(x, call = error_call)
       6. │   └─ISAnalytics:::.execute_map_job(...) at ISAnalytics/R/internal-functions.R:5952:5
       7. │     └─future::plan(future::multisession, workers = max_workers) at ISAnalytics/R/internal-functions.R:924:9
       8. │       └─future (local) plan_set(...)
       9. │         └─future:::plan_init(stack[[1]], debug = debug)
      10. │           └─future:::makeFutureBackend(evaluator, debug = debug)
      11. │             └─base::do.call(factory, args = args, envir = envir)
      12. └─future (local) `<fn>`(workers = 28L)
      13.   └─future::ClusterFutureBackend(...)
      14.     └─clusterRegistry$startCluster(...)
      15.       └─future (local) makeCluster(workers, ...)
      16.         ├─base::do.call(makeClusterPSOCK, args = args, quote = TRUE)
      17.         └─parallelly (local) `<fn>`(base::quote(28L), rscript_libs = base::quote(`<chr>`))
      18.           └─parallelly:::checkNumberOfLocalWorkers(workers)
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     
     Error: processing vignette 'workflow_start.Rmd' failed with diagnostics:
     Attempting to set up 28 localhost parallel workers with only 4 CPU cores available for this R process (per 'SGE'), which could result in a 700% load. The hard limit is set to 300%. Overusing the CPUs has negative impact on the current R process, but also on all other processes of yours and others running on the same machine. See help("parallelly.maxWorkers.localhost", package = "parallelly") for further explanations and how to override the hard limit that triggered this error
     --- failed re-building ‘workflow_start.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘workflow_start.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

# pavo (2.10.0)

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

# rtemis (1.2.7)

* GitHub: <https://github.com/rtemis-org/rtemis>
* Email: <mailto:gennatas@gmail.com>
* GitHub mirror: <https://github.com/cran/rtemis>

Run `revdepcheck::revdep_details(, "rtemis")` for more info

## In both

*   checking tests ...
     ```
     ...
       
       2026-10-18 00:16:50 [0m[1;38;2;15;106;102m✓[0m Done in 0.36 seconds.[0m [train]
       [ FAIL 1 | WARN 4 | SKIP 4 | PASS 356 ]
       
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • For local testing only; requires CSV file (3): 'test_ClusterConfig.R:19:3',
         'test_DecomposeConfig.R:19:3', 'test_SuperConfig.R:48:3'
       • empty test (1):
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test_Clustering.R:96:3'): cluster_DBSCAN() succeeds ─────────────────
       Error: approx must be a single, finite, nonnegative number.
       Backtrace:
           ▆
        1. └─rtemis::cluster(...) at test_Clustering.R:96:3
        2.   └─rtemis:::cluster_(config = config, x = x, verbosity = verbosity) at rtemis/R/cluster.R:86:3
        3.     ├─S7::S7_dispatch() at rtemis/R/00_init.R:268:5
        4.     └─rtemis (local) `method(cluster_, rtemis::DBSCANConfig)`(...)
        5.       └─dbscan::dbscan(...) at rtemis/R/cluster_DBSCAN.R:22:3
        6.         └─dbscan:::.validate_nonnegative_scalar(extra$approx %||% 0, "approx")
       
       [ FAIL 1 | WARN 4 | SKIP 4 | PASS 356 ]
       Error:
       ! Test failures.
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

