#'Selects random columns from a matrix
#'
#'Without replacement, selects columns at random
#
#'@param mat_eg matrix (reference dataset).
#'@param min_sample_size numeric, number of samples to extract from each class (reference dataset).
#'@return mat_eg[,temp ] matrix, with random samples identified.
#
#'@export
#'


id_sample <- function(mat_eg, min_sample_size)
{

  temp<-sample(1:ncol(mat_eg), size=min_sample_size)
  return(mat_eg[,temp ])
  #adapted from https://stackoverflow.com/users/6678726/lefft
  #adapted from: https://stackoverflow.com/users/11748455/josh-pachner
}
