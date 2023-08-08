#'Calculates Aitchison's Distance (matrices)
#'
#'Takes two matrices, in compositional form, returns
#'Aitchison's distance
#'@param mat1 matrix variable (query data).
#'@param mat2 matrix variable (referernce data).
#'@return aitch_mat matrix variable consisting of Aitchison's distances.
#
#'@export
#'

cal_matAD<-function(mat1,mat2)
{
  aitch_mat <- outer(
    1:ncol(mat1),
    1:ncol(mat2),
    Vectorize(function(i,j) aitch2(as.vector(mat1[,i]), as.vector(mat2[,j])))
  )
  return(aitch_mat)
}
