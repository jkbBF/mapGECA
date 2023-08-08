#' Query and reference datasets
#'
#' The query dataset (query_data) comprises  four samples taken at random from the
#' Umpire package - two 'normal' samples (samples 1,2), two cancer samples (samples 3,4).
#' See Umpire Package (R) 2.0.10, Kevin R. Coombes, Jiexin Zhang, Caitlin E. Coombes.
#' The reference dataset (ref_data) consists of two classes, 35 are in class 1 (normal),
#' 48 are from class 2 (cancer).

#'
#' @format Each is a matrix with 19,629 genes, with 4 samples in query_data and 83 in ref_data.
#' @examples
#' ref_data
#' query_data

#' @rdname geca_data
#' @format NULL
"ref_data"

#' @rdname geca_data
#' @format NULL
"query_data"
