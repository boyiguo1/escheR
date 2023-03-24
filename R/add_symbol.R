#' Adding symbols to each spot in the spatial map
#'
#' @param p a spatial map created by \code{make_escheR()}, with or without other layers of aesthetics.
#' @param var A character(1) with the name of the colData(spe) column that has the values to be used as the background.
#' @param size A numeric(1) specifying the size of the symbols in the ggplot. Defaults to 1.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object.
#'
#' @import ggplot2
#'
#' @export
#'
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
#' add_symbol(var = "intissue")
#'}
add_symbol <- function(
    p,
    var,
    size = 1,
    ...){

  if(!is.character(var) || length(var) != 1)
    stop("The argument var must be character of length one.")

  if(!var %in% colnames(p$data))
    stop(paste0("Please add the variable ", var, " to colData(spe)."))

  if(is.numeric(p$data[,var]))
    stop("add_symbol can only work with discrete variables.")

  # browser()
  # n_levels <- length(unique(p$data[,var]))
  # if( n_levels >= 3)
  #   stop("add_symbol can only work with less than 3 levels")

  # if(class(p$data[,var]) != "factor")
  p$data[,var] <- factor(p$data[,var])

  # p$data[, "tmp"] <- 1:nrow(p$data)

  # shape <- c(8, 3, 4)
# browser()

  p +
    # scale_fill_discrete() +
    geom_point(
      aes(shape = !!sym(var)),
      size = size,
      color = "black",
      alpha = 1
    ) +
    scale_shape()


}
