#' @title Add image path to a data frame
#' @description This function allows you to add an image path to a data frame based on the data contained in a column of the data frame
#' @param data your data frame
#' @param column_name the column containing values you want to convert to an image path
#' @keywords image
#' @export
#' @examples
#' to_image <- function(data = d, column_name = "state")
to_image <- function(data, column_name = "state"){
  dplyr::mutate(data, ImagePath = paste0(new_dir, "/", .data[[column_name]], ".png"))
}
