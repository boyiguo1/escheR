#' Create a new spatial map for spatial transcriptomics data
#'
#'  \code{make_escheR()} is a generic function to initialize a ggplot object that contains a
#'  spatial map. Because the ggplot object saves the input spatial transcriptomics data,
#'  the transcriptomics data will be used in the following layering process to add
#'   more aesthestic components in the plot following the grammar of graphics and ggplot2 syntax.
#'
#' @param object a data object that contains the spatial transcriptomics data.
#'  Currently only working for spatial transcriptomics data as \code{SpatialExperiment} objects
#' @param spot_size A numeric(1) specifying the size of the spot in the ggplot. Defaults to 2.
#' @param ... Reserved for future arguments
#'
#' @return an ggplot object that contains the spatial transcriptomics data
#'
#' @rdname make_escheR
#'
#' @export
#'
#' @examples
#'\dontrun{
#'library(spatialLIBD)
#'
#'if (!exists("spe"))
#'   spe <- fetch_data("spatialDLPFC_Visium")
#'
#'# Subset one sample
#'spe <- spe[, spe$sample_id == "Br8667_mid"]
#'
#'make_escheR(spe)
#'}
make_escheR <- function(object, ...){
  UseMethod("make_escheR", object)
}



#'
#' @rdname make_escheR
#'
#' @export
#'
make_escheR.SpatialExperiment <- function(
    spe,
    spot_size = 2,
    ...){

  if(length(unique(spe$sample_id))!= 1)
    stop("The function only works for spe object with one sample.")

  p <- spatialLIBD::vis_gene(
    spe = spe,
    spatial = FALSE,
    point_size = spot_size
  ) +
    labs(title = "")

  p$layers <- NULL

  p$spe <- spe
  return(p)
}
