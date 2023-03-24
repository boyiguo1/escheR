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
#' @import ggplot2
#' @export
#' @examples
#' \dontrun{
#'library(spatialLIBD)
#'
#'if (!exists("spe"))
#'   spe <- fetch_data("spatialDLPFC_Visium")
#'
#'# Subset one sample
#'spe <- spe[, spe$sample_id == "Br8667_mid"]
#'
#'make_escheR(spe) |>
#' add_ground(var = "BayesSpace_harmony_09")
#'}
add_ground <- function(
    p,
    var,
    stroke = 0.5,
    point_size = 2,
    ...){


  if(!is.character(var) || length(var) != 1)
    stop("The argument var must be character of length one.")

  if(!var %in% colnames(p$data))
    stop(paste0("Please add the variable ", var, " to colData(spe)."))

  if(is.numeric(p$data[,var])) {
    p <- suppressMessages({p + scale_color_continuous()})
  } else{
    p <- suppressMessages({p + scale_color_discrete()})
  }

  p +
    geom_point(
      aes(color = !!sym(var),
      ),
      shape = 21,
      fill = "transparent",
      size = point_size,
      stroke = stroke,
      ...
    )
}
