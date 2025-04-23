to_image <- function(data, column_name){
  dir.create("images")
  dpylr::mutate(data, ImagePath = paste0("images/", column_name, ".png"))
}
