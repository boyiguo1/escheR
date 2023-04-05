#' Adding fill to highlight the figure in the spatial map
#'
#' @param p a spatial map created by \code{make_escheR()}, with or without other layers of aesthetics.
#' @param var A character(1) with the name of the colData(spe) column that has the values to be used as the background.
#' @param point_size A numeric(1) specifying the size of the spot in the ggplot. Defaults to 2.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object.
#'
#' @importFrom ggplot2 geom_point aes
#' @importFrom rlang sym
#'
#' @export
#' @examples
#' library(STexampleData)
#' library(spatialLIBD)
#'
#' spe <- Visium_humanDLPFC()
#'
#' make_escheR(spe) |>
#'     add_fill(var = "ground_truth")
add_fill <- function(p,
    var,
    point_size = 2,
    ...) {
    if (!is.character(var) || length(var) != 1) {
        stop("The argument var must be character of length one.")
    }


    if (!var %in% colnames(p$data)) {
        stop("Please add the variable ", var, " to colData(spe).")
    }

    p +
        geom_point(
            aes(fill = !!sym(var)),
            shape = 21,
            stroke = 0,
            size = point_size
        )
}
