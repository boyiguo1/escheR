#' Create a new spatial map for spatial transcriptomics data
#'
#'  \code{make_escheR()} is a generic function to initialize a ggplot object
#'   that contains a spatial map. Because the ggplot object saves the input
#'  spatial transcriptomics data, the transcriptomics data will be used in
#'   the following layering process to add more aesthestic components in the
#'    plot following the grammar of graphics and ggplot2 syntax.
#'
#'
#'
#' @param object a data object that contains the spatial transcriptomics data.
#'  Currently only working for spatial transcriptomics data as
#'  \code{SpatialExperiment} objects.
#' @param spot_size A numeric(1) specifying the size of the spot in the ggplot.
#'  Defaults to 2.
#' @param y_reverse (logical) Whether to reverse y coordinates, which is often
#'   required for 10x Genomics Visium data. Default = TRUE.
#' @param ... Reserved for future arguments.
#'
#' @return an ggplot object that contains the spatial transcriptomics data.
#'
#' @rdname make_escheR
#'
#' @references
#'  Guo B, Huuki-Myers LA, Grant-Peters M, Collado-Torres L, Hicks SC (2023).
#'  escheR: Unified multi-dimensional visualizations with Gestalt principles.
#'   _bioRxiv_. doi:10.1101/2023.03.18.533302
#'
#'
#'
#' @export
#'
#' @examples
#' library(STexampleData)
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
#' @importFrom ggplot2 scale_shape theme theme_bw theme_set unit xlab ylab scale_y_reverse
#' @importFrom SpatialExperiment imgRaster spatialCoords scaleFactors
#' @export
#'
make_escheR.SpatialExperiment <- function(
    object,
    spot_size = 2,
    # assay_name = "counts",
    y_reverse = TRUE,
    ...) {
  if (length(unique(object$sample_id)) != 1) {
    stop("The function only works for spe object with one sample.")
  }


  spe <- object

  # Error prevention: Check necessary spe components
  if(is.null(spatialCoords(spe)))
    stop("The object (SpatialExperiment) must have spatialCoords(object)")

  if(is.null(colData(spe)))
    warning("The object (SpatialExperiment) did not have colData(object)")


  # Allowing to use different assays which array data this should be
  # Check assay name exists
  # Note: maybe future solution
  # if(!(assay_name %in% assayNames(spe)))
  #   stop("assay_name = ", assay_name,
  #        " are not found in assayNames(object).")

  # TODO (Must): save assay in the data.frame

  # TODO (Medium): How about dimension reduction assays?
  coord_df <- SpatialExperiment::spatialCoords(spe)
  colnames(coord_df) <- c(".x", ".y")

  d <- as.data.frame(
    cbind(
      colData(spe),
      SpatialExperiment::spatialCoords(spe) #,
      # NOTE: Computation cost as this conversion
      #       will take a lot of memory space
      # t(as.matrix(assays(spe)[[assay_name]]))
    ),
    optional = TRUE
  )

  if(.contain_reserved_col_name(colnames(d)))
    warning("CAUSTION: colData(spe) contains the reserved names, which will
            be overwriten by make_escheR. Reserved names include ",
            .reserved_col_name(), ".")

  d <- cbind(d, coord_df)


  sampleid <- unique(spe$sample_id)[1]


  # TODO (must): what if there no underlying image
  # if(is.null(SpatialExperiment::imgData(spe))){
  #   stop("Not implmented yet")
  #   #TODO: implement this
  # }



  # TODO (low): underlying image exists, should we adjust the underlying image
  # img <-
  #   SpatialExperiment::imgRaster(
  #     spe,
  #     sample_id = unique(spe$sample_id)[1],
  #     image_id = image_id
  #   )


  # TODO: this to be an internal funciton operating on .x and .y
  p <-
    ggplot(
      d,
      aes(
        x = .x,
        y = .y
      )
    ) +
    # TODO (medium): maybe move the theme to an outside function
    xlab("") +
    ylab("") +
    coord_fixed() +
    theme_void() #+
  # theme_set(theme_bw(base_size = 20)) +
  # theme(
  #   panel.grid.major = element_blank(),
  #   panel.grid.minor = element_blank(),
  #   panel.background = element_blank(),
  #   axis.line = element_blank(),
  #   axis.text = element_blank(),
  #   axis.ticks = element_blank(),
  #   legend.title = element_text(size = 10),
  #   legend.box.spacing = unit(0, "pt")
  # )
  ### END

  # reverse y coordinates to match orientation of images
  # Inspiration from
  # https://github.com/lmweber/ggspavis/blob/004e1528829641cd2112e4264bb7fb708316c0e5/R/plotSpots.R#L102
  if(y_reverse){
    p <- p + scale_y_reverse()
  }


  p$spe <- object
  return(p)
}
