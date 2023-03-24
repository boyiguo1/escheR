#' Adding fill to highlight the figure in the spatial map
#'
#' @param p a spatial map created by \code{make_escheR()}, with or without other layers of aesthetics.
#' @param var A character(1) with the name of the colData(spe) column that has the values to be used as the background.
#' @param point_size A numeric(1) specifying the size of the spot in the ggplot. Defaults to 2.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object.
#'
#' @import ggplot2
#' @importFrom rlang sym
#'
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
#' add_ground(var = "BayesSpace_harmony_09") |>
#' add_fill(var = "")
#'}
add_fill <- function(
    p,
    var,
    point_size = 2,
    ...){


  if(!is.character(var) || length(var) != 1)
    stop("The argument var must be character of length one.")

  # browser()

  if(!var %in% colnames(p$data))
    stop(paste0("Please add the variable ", var, " to colData(spe)."))

  # if(is.numeric(p$data[,var])) {
  #   stop("")
  #   p <- suppressMessages({p + scale_fill_continuous()})
  # } else{
  #   p <- suppressMessages({p + scale_fill_discrete()})
  # }


  # browser()
 p +
    geom_point(
      aes(fill = !!sym(var)
      ),
      shape = 21,
      stroke = 0,
      size = point_size
    )

  # if(!is.numeric(p$data[,var]))
  #   tmp <- tmp +
  #   scale_fill_manual(
  #     name = "",
  #     values = libd_layer_colors |>
  #       setNames(c(paste0("L", 1:6), "WM", "NA", "WM2"))
  #   )


  # tmp$scales <- tmp$scales[[-1]]
}
