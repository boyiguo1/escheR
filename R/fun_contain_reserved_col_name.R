#' Check if rowData(spe) contains reserved name
#'
#' Internal Funciton
#'
#' @param col_name the colnames
#'
#' @return TRUE when col_name contains reserved names, FALSE
#'
.contain_reserved_col_name <- function(col_name){
  reserved_col_names <- c(
    ".x",
    ".y"
  )

  any(reserved_col_names %in% col_name)
}

.reserved_col_name <- function(){
  reserved_col_names <- c(
    ".x",
    ".y"
  )

  reserved_col_names
}
