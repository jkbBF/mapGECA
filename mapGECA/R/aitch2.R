#'Calculates Aitchison's Distance
#'
#'Takes two vectors, in compositional form, returns
#'Aitchison's distance.
#'@param vec1 A vector in compositional form.
#'@param vec2 A vector in compositional form.
#'@return sum(v1v2), a numeric variable (Aitchison's distance betwen vec1 and vec2).
#
#'@export
#'


aitch2 <- function(vec1, vec2)
{
  v1v2 <- ( log(vec1/exp((mean(log(vec1)))))- log(vec2/exp((mean(log(vec2))))) )^2
  return(sum(v1v2))
}
