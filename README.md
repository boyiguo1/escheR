
# escheR

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![BioC status](http://www.bioconductor.org/shields/build/release/bioc/escheR.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/escheR)
<!-- badges: end -->

The goal of escheR is to create an unified multi-dimensional spatial visualizations for spatially-resolved transcriptomics data following Gestalt principles.

![](man/figures/insitu.jpg)

Our preprint describing the innovative visualization is available from [bioRxiv](https://www.biorxiv.org/content/10.1101/2023.03.18.533302).

# Installation

You can install the development version of escheR from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("boyiguo1/escheR")
```

The authors are submitting the package to [Bioconductor](https://bioconductor.org/). 

# Input data format

To use `escheR`, we assume the input data are provided as a [`SpatialExperiment`](https://bioconductor.org/packages/release/bioc/html/SpatialExperiment.html) Bioconductor object. For people whose data are stored as a [`Seurat`](https://satijalab.org/seurat/articles/spatial_vignette.html) object, we advise to convert to a `SpatialExperiment` object before applying the workflow below.  


# Tutorial
Please find an end-to-end tutorial at [https://boyiguo1.github.io/escheR/](https://boyiguo1.github.io/escheR/articles/SRT_eg.html)


# Citation

Our preprint describing `escheR` is available from bioRxiv:

* Guo B, Hicks SC (2023). “escheR: Unified multi-dimensional visualizations with Gestalt principles.” _bioRxiv_. doi:10.1101/2023.03.18.533302

