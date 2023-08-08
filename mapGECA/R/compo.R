#'Converts matrix to compositional form
#'
#'Takes a matrix, using the total value of each column,
#'creates a new matrix in compositional form
#'@param mat_eg matrix to be converted to compositional form.
#
#'@return inner combo matrix in compositional form.
#
#'@export
#'


compo<-function(mat_eg)
{
  inner_combo<-mat_eg/colSums(mat_eg)
  return(inner_combo)
}
