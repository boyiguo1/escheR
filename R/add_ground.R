#' Adding border to highlight the ground in the spatial map
#'
#' @param p a spatial map created by \code{make_escheR()}, with or without other layers of aesthetics.
#' @param var A character(1) with the name of the colData(spe) column that has the values to be used as the background.
#' @param stroke A numeric(1) specifying the thickness of the border.
#' @param point_size A numeric(1) specifying the size of the spot in the ggplot. Defaults to 2.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object.
#'
#' @importFrom ggplot2 geom_point aes
#' @importFrom SummarizedExperiment colData
#'
#' @export
#' @examples
#'
#' library(STexampleData)
#' library(spatialLIBD)
#'
#' spe <- Visium_humanDLPFC()
#'
#' make_escheR(spe) |>
#'     add_ground(var = "ground_truth")
#'
add_ground <- function(p,
    var,
    stroke = 0.5,
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
            aes(color = !!sym(var), ),
            shape = 21,
            fill = "transparent",
            size = point_size,
            stroke = stroke,
            ...
        )
}
