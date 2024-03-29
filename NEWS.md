# escheR 1.3.1
SIGNIFICANT USER-VISIBLE CHANGES

* Add functions `add_fill_bin` and `add_ground_bin` to provide hexgon binning strategy to mitigate the overplotting of data points
* Provide an example to use `add_fill_bin` and `add_ground_bin` with `make_escheR` to create hexgon binning plot



# escheR 1.2.0
SIGNIFICANT USER-VISIBLE CHANGES

* Add generic functions to support `SingleCellExperiment` object by
  providing values to the argument `dimred`, and `data.frame` object
* Modify the generic function `make_escheR.SpatialExperiment` to support 
`SpatialExperiment` that is beyond Visium
* Update and add new vignette to show how to work with `SingleCellExperiment` to
visualize `dimred` and color palette for bi-variate display.


# escheR 1.1.1
SIGNIFICANT USER-VISIBLE CHANGES

* The dependency on the package `spatialLIBD` are removed
* Revise the README file to add explanations for Gestalt Principles to help 
users grasp the big picture idea without going to read the manuscript.


# escheR 0.99.8
SIGNIFICANT USER-VISIBLE CHANGES

* Add a new argument `y_reverse = TRUE` to `make_escheR` to provide a consistent
orientation between spot plot and tissue image 
(see [Issue #13](https://github.com/boyiguo1/escheR/issues/13))

# escheR 0.99.7
SIGNIFICANT USER-VISIBLE CHANGES

* Add default color scheme (`viridis`) to `add_fill`
* Add explicit reference to spatialLIBD in `make_escheR` documentation
* Add installation instruction for users whose R version is pre-R4.3 


# escheR 0.99.6
SIGNIFICANT USER-VISIBLE CHANGES

* Add minimium versions to dependencies and imported packages
* Import individual functions in NAMESPACE from packages
* Clean up comments in code
* Accepted by Bioconductor and will be released in Bioconductor 3.17

# escheR 0.99.1
NEW FEATURES

* Added a `NEWS.md` file to track changes to the package.
* First full version of the package to be submitted to Bioconductor. See Bioconductor submission [here](https://github.com/Bioconductor/Contributions/issues/2988#event-8964456296).
