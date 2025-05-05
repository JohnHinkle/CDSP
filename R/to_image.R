#' @title Add image path to a data frame
#' @description This function allows you to add an image path to a data frame based on the data contained in a column of the data frame
#' @param data your data frame
#' @param column_name the column containing values you want to convert to an image path
#' @keywords image
#' @export
#' @examples
#' function(data = d, column_name = "state", dir = "states", package_name = "phylo101")
to_image <- function(data, column_name = "state", subdir = "flags", package_name = "phylo101") {
  dplyr::mutate( data, ImagePath = mapply(function(state_val) { system.file( file.path(subdir, paste0(gsub(" ", "", state_val), ".png")), package = package_name ) }, .data[[column_name]]) ) }
