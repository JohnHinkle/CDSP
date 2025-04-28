us_state_flag_tree <- function(tree, metadata, image_column = "image_path", label_column = "label") {

  # create ggtree object from tree object
  p <- ggtree(tree)

  # extract tree data and join with metadata
  tree_data <- p$data
  tip_data <- tree_data |>
    filter(isTip) |>
    left_join(metadata, by = setNames(label_column, "label"))

  # create "offset" to space flag icons at end of tip label, to prevent overlap
  offset <- max(tree_data$x, na.rm = TRUE) * 0.15

  # create ggtree plot
  p +
    geom_image(
      data = tip_data,
      aes(x = x + offset, y = y, image = .data[[image_column]]),
      size = 0.025, asp = 1.0
    ) +
    geom_tiplab(size = 3)
}
