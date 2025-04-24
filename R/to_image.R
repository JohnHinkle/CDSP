to_image <- function(data, column_name = "state", new_dir = "images"){
  dir.create(new_dir)
  dplyr::mutate(data, ImagePath = paste0(new_dir, "/", .data[[column_name]], ".png"))
}
