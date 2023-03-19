#' @export
add_ground.SpatialExperiment <- function(
    p,
    var,
    stroke = 0.5,
    point_size = 2,
    ...){


  if(!is.character(var) || length(var) != 1)
    stop("The argument var must be character of length one.")

  if(!var %in% colnames(p$data))
    stop(paste0("Please add the variable ", var, " to colData(spe)."))

  # p <- check_var(p, var)

  # browser()
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
