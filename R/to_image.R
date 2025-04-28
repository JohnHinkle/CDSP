to_image <- function(data, column_name = "state", new_dir = "states"){
  dplyr::mutate(data, ImagePath = paste0(new_dir, "/", .data[[column_name]], ".png"))
}
