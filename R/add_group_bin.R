#' @param bins numeric vector giving number of bins in both vertical and
#'             horizontal directions. Set to 30 by default.
#' @param ...
#'
#' @rdname add_ground
#' @export
#' @importFrom ggplot2 scale_color_discrete
add_ground_bin <- function(
    p,
    var,
    bins = 30,
    stroke = 1,
    point_size = 3
    ,...){
  p +
    stat_summary_hex(
    aes(
      z = !!sym(var),
      group = -1,
      color = after_stat(value),
      fill = after_stat(rep(NA_integer_, length(value)))
    ),
    geom = "point",
    shape = 21,
    size = point_size,
    stroke = stroke,
    # Majority Voting
    fun = function(x){
      ll <- data.frame(table(x))
      as.character(ll[which.max(ll$Freq),"x"])
    },
    bins = bins
  ) +
    scale_color_discrete(name = var)
}
