#'Returns random matches for query samples given reference.
#'
#'Compares a set of query samples against a reference dataset using random shuffling of matches.
#'@param no_perms a numeric indicating the number of iterations.
#
#'@return threshold_pass a matrix representing random matches of a query to a reference dataset.

#'@export
#'


test_for_ran<-function(no_perms)
{

  #row_r=ref_size_balance

  mat_temp1 <- matrix(sapply(1:col_q, function(i) {pv<<-stats::rmultinom(n = 1, size = num_sigs, prob = rep(1/row_r, row_r))}),byrow=T,nrow=col_q)
  threshold_pass<-ifelse(obs_fpp<mat_temp1,1 , 0)
  threshold_pass<-t(threshold_pass)
  return(threshold_pass)#returns observed values which exceed 'random' matches
}
