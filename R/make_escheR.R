#' Create a new spatial map for spatial transcriptomics data
#'
#'  \code{make_escheR()} is a generic function to initialize a ggplot object that contains a
#'  spatial map. Because the ggplot object saves the input spatial transcriptomics data,
#'  the transcriptomics data will be used in the following layering process to add
#'   more aesthestic components in the plot following the grammar of graphics and ggplot2 syntax.
#'
#' @param object a data object that contains the spatial transcriptomics data.
#'  Currently only working for spatial transcriptomics data as \code{SpatialExperiment} objects.
#' @param spot_size A numeric(1) specifying the size of the spot in the ggplot. Defaults to 2.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object that contains the spatial transcriptomics data.
#'
#' @rdname make_escheR
#'
#'
#' @export
#'
#' @examples
#' library(STexampleData)
#' library(spatialLIBD)
#'
#' spe <- Visium_humanDLPFC()
#'
#' make_escheR(spe)
make_escheR <- function(object, spot_size = 2, ...) {
  UseMethod("make_escheR", object)
}



#'
#' @rdname make_escheR
#' @importFrom ggplot2 aes element_blank element_text geom_point ggplot
#' @importFrom ggplot2 scale_shape theme theme_bw theme_set unit xlab ylab
#' @importFrom SpatialExperiment imgRaster spatialCoords scaleFactors
#' @importFrom spatialLIBD frame_limits
#' @export
#'
make_escheR.SpatialExperiment <- function(
    object,
    spot_size = 2,
    ...) {
  if (length(unique(object$sample_id)) != 1) {
    stop("The function only works for spe object with one sample.")
  }


  ## This section of code is adapted from spatialLIBD
  pxl_row_in_fullres <-
    pxl_col_in_fullres <- key <- NULL

  spe <- object
  auto_crop <- TRUE

  d <- as.data.frame(
    cbind(
      colData(spe),
      SpatialExperiment::spatialCoords(spe)
    ),
    optional = TRUE)

  sampleid <- unique(spe$sample_id)[1]
  image_id <- "lowres"

  img <-
    SpatialExperiment::imgRaster(
      spe,
      sample_id = unique(spe$sample_id)[1],
      image_id = image_id
    )


  ## Crop the image if needed
  if (auto_crop) {
    frame_lims <-
      frame_limits(spe, sampleid = sampleid, image_id = image_id)
    img <-
      img[frame_lims$y_min:frame_lims$y_max, frame_lims$x_min:frame_lims$x_max]
    adjust <-
      list(x = frame_lims$x_min, y = frame_lims$y_min)
  } else {
    adjust <- list(x = 0, y = 0)
  }
  p <-
    ggplot(
      d,
      aes(
        x = pxl_col_in_fullres * SpatialExperiment::scaleFactors(spe, sample_id = sampleid, image_id = image_id) - adjust$x,
        y = pxl_row_in_fullres * scaleFactors(spe, sample_id = sampleid, image_id = image_id) - adjust$y,
        key = key
      )
    ) +
    xlab("") +
    ylab("") +
    theme_set(theme_bw(base_size = 20)) +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      legend.title = element_text(size = 10),
      legend.box.spacing = unit(0, "pt")
    )
  ### END


  p$spe <- object
  return(p)
}
