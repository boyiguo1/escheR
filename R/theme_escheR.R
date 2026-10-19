#' Customize plots 
#'
#' border - choose whether to display a border around the plotting panel 
#' border_colour - choose colour of the panel border.
#' border_width - choose Width of the panel border.
#'
#' @return A ggplot2 theme object.
#'
#'
#' @examples
#' theme_escheR()
#' theme_escheR(border = TRUE)
#' theme_escheR(
#'   border = TRUE,
#'   border_colour = "black",
#'   border_width = 1
#' )
theme_escheR <- function(
    border = FALSE,
    border_colour = "black",
    border_width = 0.5
) {
  p <- theme_void()

  if (border) {
    p <- p +
      theme(
        panel.border = element_rect(
          colour = border_colour,
          fill = NA,
          linewidth = border_width
        )
      )
  }

  return(p)
}
