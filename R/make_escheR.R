#' Title
#'
#' @param object
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
make_escheR <- function(object, ...){
  UseMethod("make_escheR", object)
}


#' @export
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
  # p$scales <- NULL

  p$spe <- spe
  return(p)
}
