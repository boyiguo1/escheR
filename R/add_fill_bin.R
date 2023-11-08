#' @param bins numeric vector giving number of bins in both vertical and
#'             horizontal directions. Set to 30 by default.
#'
#' @rdname add_fill
#' @export
#' @importFrom ggplot2 stat_summary_hex scale_fill_gradient after_stat
add_fill_bin <- function(
    p,
    var,
    bins = 30,
    point_size = 2.8,
    ...){
  p +
    stat_summary_hex(
      aes(z = !!sym(var), fill = after_stat(value)),
      color = "transparent",
      geom = "point",
      shape = 21,
      size = 2.8,
      fun = sum,
      bins = bins
    ) +
    scale_fill_gradient(name = var)
}
