#' Adding symbols to each spot in the spatial map
#'
#' @param p a spatial map created by \code{make_escheR()}, with or without other layers of aesthetics.
#' @param var A character(1) with the name of the colData(spe) column that has the values to be used as the background.
#' @param size A numeric(1) specifying the size of the symbols in the ggplot. Defaults to 1.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object.
#'
#'
#' @importFrom ggplot2 geom_point aes scale_shape
#' @importFrom rlang sym
#' @export
#'
#' @examples
#' library(STexampleData)
#' library(spatialLIBD)
#'
#' spe <- Visium_humanDLPFC()
#'
#' # Convert a continuous variable to categorical
#' spe$in_tissue <- factor(spe$in_tissue)
#'
#' make_escheR(spe) |>
#'     add_ground(var = "ground_truth") |>
#'     add_symbol(var = "in_tissue", size = 0.5)
add_symbol <- function(
        p,
        var,
        size = 1,
        ...) {
    if (!is.character(var) || length(var) != 1) {
        stop("The argument var must be character of length one.")
    }

    if (!var %in% colnames(p$data)) {
        stop("Please add the variable ", var, " to colData(spe).")
    }

    if (is.numeric(p$data[, var])) {
        stop("add_symbol can only work with discrete variables.")
    }

    p$data[, var] <- factor(p$data[, var])

    p +
        geom_point(
            aes(shape = !!sym(var)),
            size = size,
            color = "black",
            alpha = 1
        ) +
        scale_shape()
}
