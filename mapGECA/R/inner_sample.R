#'Returns random columns from a matrix
#'
#'Without replacement, returns columns at random from a matrix using the minimum sample size
#
#'@param mat_eg matrix (reference dataset).
#'@param min_sample_size numeric, number of samples to extract from each class (reference dataset).
#'@return temp_ref_uni_sample vector indices of randomly-selected samples.
#
#'@export
#'


inner_sample<-function(mat_eg,min_sample_size)
{
  temp_ref_uni<-(matrix(mat_eg,byrow=T,nrow=dim(mat_eg)[[2]]))
  temp_ref_uni_sample<- id_sample(temp_ref_uni, min_sample_size)
  return(temp_ref_uni_sample)
  #adapted from https://stackoverflow.com/users/6678726/lefft
  #adapted from: https://stackoverflow.com/users/11748455/josh-pachner
}
