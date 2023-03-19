#' @export
add_symbol.SpatialExperiment <- function(
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
