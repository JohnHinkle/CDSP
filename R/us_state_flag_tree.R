#' @title Annotate phylogenetic trees with USA state flags
#' @description This function allows you to plot a phylogenetic tree annotated with the United States of America state flag that corresponds with a tip.
#' @param tree tree object
#' @param metadata metadata associated with tree
#' @param image_column column containing pathway to state flag icons
#' @param label_column column containing tip labels (ex. taxonomic name, or accession number)
#' @keywords tree
#' @export
#' @examples
#' us_state_flag_tree(tree = t, metadata = d, image_column = "image_path", label_column = "label")
us_state_flag_tree <- function(tree, metadata, image_column = "image_path", label_column = "label") {

  # create ggtree object from tree object
  p <- ggtree::ggtree(tree)

  # extract tree data and join with metadata
  tree_data <- p$data
  tip_data <- tree_data |>
    dplyr::filter(isTip) |>
    dplyr::left_join(metadata, by = setNames(label_column, "label"))

  # create "offset" to space flag icons at end of tip label, to prevent overlap
  offset <- max(tree_data$x, na.rm = TRUE) * 0.15

  # create ggtree plot
  p +
    ggimage::geom_image(
      data = tip_data,
      aes(x = x + offset, y = y, image = .data[[image_column]]),
      size = 0.025, asp = 1.0
    ) +
    ggtree::geom_tiplab(size = 3)
}
