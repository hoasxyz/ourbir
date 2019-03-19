#' Get path to bir_to example
#'
#' bir_to comes bundled with some example files in its \code{inst/extdata}
#' directory. This function make them easy to access.
#'
#' @param path Name of file. If \code{NULL}, the example files will be listed.
#' @export
#' @examples
#' bir_file()
#' bir_file("example.xlsx")

bir_file <- function(path = NULL){
  if (is.null(path)) {
    dir(system.file("extdata", package = "ourbir"))
  } else {
    system.file("extdata", path, package = "ourbir", mustWork = TRUE)
  }
}
