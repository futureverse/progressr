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

# AlpsNMR (4.12.0)

* GitHub: <https://github.com/sipss/AlpsNMR>
* Email: <mailto:sergioller@gmail.com>

Run `revdepcheck::revdep_details(, "AlpsNMR")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /c4/home/henrik/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /c4/home/henrik/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     Warning: LaTeX Warning: You have requested package `/scratch/henrik/revdep/progressr/library/AlpsNMR/BiocStyle/resources/tex/Bioconductor',
     Warning:                but the package provides `Bioconductor'.
     --- finished re-building ‘Vig01-introduction-to-alpsnmr.Rmd’
     
     --- re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’ using rmarkdown
     Warning: LaTeX Warning: You have requested package `/scratch/henrik/revdep/progressr/library/AlpsNMR/BiocStyle/resources/tex/Bioconductor',
     Warning:                but the package provides `Bioconductor'.
     --- finished re-building ‘Vig01b-introduction-to-alpsnmr-old-api.Rmd’
     
     --- re-building ‘Vig02-handling-metadata-and-annotations.Rmd’ using rmarkdown
     ! LaTeX Error: No counter 'none' defined.
     
     Error: processing vignette 'Vig02-handling-metadata-and-annotations.Rmd' failed with diagnostics:
     LaTeX failed to compile /scratch/henrik/revdep/progressr/checks/AlpsNMR/new/AlpsNMR.Rcheck/vign_test/AlpsNMR/vignettes/Vig02-handling-metadata-and-annotations.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Vig02-handling-metadata-and-annotations.log for more info.
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
     ...
       ...
     --- re-building ‘econet.tex’ using tex
     Warning in texi2dvi(pathnameR, pdf = pdf, clean = clean, quiet = quiet,  :
       texi2dvi script/program not available, using emulation
     Error: processing vignette 'econet.tex' failed with diagnostics:
     unable to run pdflatex on 'econet.tex'
     LaTeX errors:
     ! LaTeX Error: File `orcidlink.sty' not found.
     
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

# EFAtools (0.6.1)

* GitHub: <https://github.com/mdsteiner/EFAtools>
* Email: <mailto:markus.d.steiner@gmail.com>
* GitHub mirror: <https://github.com/cran/EFAtools>

Run `revdepcheck::revdep_details(, "EFAtools")` for more info

## In both

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

# mapme.biodiversity (0.9.5)

* GitHub: <https://github.com/mapme-initiative/mapme.biodiversity>
* Email: <mailto:sven.bergtold@gmail.com>
* GitHub mirror: <https://github.com/cran/mapme.biodiversity>

Run `revdepcheck::revdep_details(, "mapme.biodiversity")` for more info

## In both

*   checking tests ...
     ```
     ...
         'test-get_carbon.R:2:3', 'test-get_carbon.R:29:3', 'test-get_chelsa.R:2:3',
         'test-get_esalandcover.R:2:3', 'test-get_fritz_et_al.R:2:3',
         'test-get_gfw_emissions.R:2:3', 'test-get_gfw_lossyear.R:2:3',
         'test-get_gfw_treecover.R:7:3', 'test-get_gmw.R:2:3', 'test-get_gsw.R:2:3',
         'test-get_hfp.R:10:3', 'test-get_mcd64A1.R:2:3', 'test-get_nasa_grace.R:2:3',
         'test-get_nasa_srtm.R:2:3', 'test-get_nelson_et_al.R:2:3',
         'test-get_resources.R:2:3', 'test-get_soilgrids.R:2:3',
         'test-get_teow.R:2:3', 'test-get_ucdp_ged.R:3:3', 'test-get_worldpop.R:2:3',
         'test-ipbes.R:2:3', 'test-ipbes.R:11:3'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-chunking.R:7:3'): .crosses_dateline and .split_dateline works ──
       Expected `x2 <- .split_dateline(x)` to run silently.
       Actual noise: warnings.
       ── Failure ('test-chunking.R:8:3'): .crosses_dateline and .split_dateline works ──
       Expected `nrow(x2)` to equal 2.
       Differences:
         `actual`: 1.0
       `expected`: 2.0
       
       
       [ FAIL 2 | WARN 0 | SKIP 43 | PASS 543 ]
       Error:
       ! Test failures.
       Execution halted
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
     See ‘/scratch/henrik/revdep/progressr/checks/pavo/new/pavo.Rcheck/00install.out’ for details.
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

# receptiviti (0.2.1)

* GitHub: <https://github.com/Receptiviti/receptiviti-r>
* Email: <mailto:kenglish@receptiviti.com>
* GitHub mirror: <https://github.com/cran/receptiviti>

Run `revdepcheck::revdep_details(, "receptiviti")` for more info

## In both

*   checking tests ...
     ```
     ...
       
       ══ Skipped tests (4) ═══════════════════════════════════════════════════════════
       • no API key (4): 'test-receptiviti.R:78:1',
         'test-receptiviti_frameworks.R:1:1', 'test-receptiviti_norming.R:12:1',
         'test-receptiviti_status.R:13:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Error ('test-receptiviti.R:9:3'): invalid inputs are caught ─────────────────
       Error: Invalid header received from client.
       
       Backtrace:
           ▆
        1. ├─testthat::expect_error(...) at test-receptiviti.R:9:3
        2. │ └─testthat:::expect_condition_matching_(...)
        3. │   └─testthat:::quasi_capture(...)
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

# rsi (0.3.2)

* GitHub: <https://github.com/Permian-Global-Research/rsi>
* Email: <mailto:mike.mahoney.218@gmail.com>
* GitHub mirror: <https://github.com/cran/rsi>

Run `revdepcheck::revdep_details(, "rsi")` for more info

## In both

*   checking tests ...
     ```
     ...
         'test-spectral_indices.R:95:3', 'test-spectral_indices.R:103:3',
         'test-spectral_indices.R:110:3', 'test-spectral_indices.R:117:3',
         'test-spectral_indices.R:124:3', 'test-spectral_indices.R:131:3',
         'test-spectral_indices.R:138:3', 'test-spectral_indices.R:145:3',
         'test-spectral_indices.R:152:3', 'test-spectral_indices.R:161:3',
         'test-spectral_indices.R:170:3', 'test-spectral_indices.R:179:3',
         'test-spectral_indices.R:188:3', 'test-spectral_indices.R:197:3',
         'test-spectral_indices.R:206:3', 'test-spectral_indices.R:214:1',
         'test-calculate_indices.R:5:3', 'test-calculate_indices.R:28:3',
         'test-calculate_indices.R:51:3', 'test-calculate_indices.R:64:3',
         'test-calculate_indices.R:77:3', 'test-stack_rasters.R:114:1',
         'test-stack_rasters.R:135:1'
       
       ══ Failed tests ════════════════════════════════════════════════════════════════
       ── Failure ('test-filters.R:45:3'): filter_bands() works ───────────────────────
       Expected `all(...)` to be TRUE.
       Differences:
       `actual`:   FALSE
       `expected`: TRUE 
       
       
       [ FAIL 1 | WARN 0 | SKIP 51 | PASS 32 ]
       Error:
       ! Test failures.
       Execution halted
     ```

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘calculate_indices.Rd’ ‘get_stac_data.R’ ‘get_stac_data.Rd’
         ‘landsat_mask_function.Rd’
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
     See ‘/scratch/henrik/revdep/progressr/checks/stppSim/new/stppSim.Rcheck/00install.out’ for details.
     ```

# tsgarch (1.0.3)

* GitHub: <https://github.com/tsmodels/tsgarch>
* Email: <mailto:alexios@4dscape.com>
* GitHub mirror: <https://github.com/cran/tsgarch>

Run `revdepcheck::revdep_details(, "tsgarch")` for more info

## In both

*   checking DESCRIPTION meta-information ... NOTE
     ```
       Missing dependency on R >= 4.1.0 because package code uses the pipe
       |> or function shorthand \(...) syntax added in R 4.1.0.
       File(s) using such syntax:
         ‘benchmark.R’ ‘print.R’
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
     See ‘/scratch/henrik/revdep/progressr/checks/vmeasur/new/vmeasur.Rcheck/00install.out’ for details.
     ```

# WeightedCluster (2.0)

* Email: <mailto:matthias.studer@unige.ch>
* GitHub mirror: <https://github.com/cran/WeightedCluster>

Run `revdepcheck::revdep_details(, "WeightedCluster")` for more info

## In both

*   checking re-building of vignette outputs ... WARNING
     ```
     ...
     
     --- re-building ‘WeightedClusterPreview.Rnw’ using knitr
     Warning in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  :
       texi2dvi script/program not available, using emulation
     Error: processing vignette 'WeightedClusterPreview.Rnw' failed with diagnostics:
     unable to run pdflatex on 'WeightedClusterPreview.tex'
     LaTeX errors:
     ! LaTeX Error: File `textpos.sty' not found.
     
     Type X to quit or <RETURN> to proceed,
     or enter new name. (Default extension: sty)
     
     ! Emergency stop.
     <read *> 
              
     l.85 \usepackage
                     {tikz}^^M
     !  ==> Fatal error occurred, no output PDF file produced!
     --- failed re-building ‘WeightedClusterPreview.Rnw’
     
     SUMMARY: processing the following files failed:
       ‘WeightedClusterFR.Rnw’ ‘WeightedClusterPreview.Rnw’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

