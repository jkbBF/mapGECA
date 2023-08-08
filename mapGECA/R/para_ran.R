#'Returns most similar matches for query samples given reference (parallel)
#'
#'Compares a set of query samples against a reference dataset using random gene sets
#'Exports inner functions and variables to each core
#'@param no_cores_free numeric, keeps cores free on user's machine, default=2.
#'@param random_sig_list list, output from para_map()
#'@param no_perms numeric, the number of iterations.
#'@param query_data matrix, a query dataset.
#'@param ID_classes vector of class labels.
#'@param min_sample_size numeric user-defined, number of samples from each reference dataset to be sampled.
#'@param num_sigs user-defined =number signatures used.
#'@return list
#
#'@export
#'


para_ran<-function(no_cores_free=2,no_perms, random_sig_list,query_data,ID_classes, min_sample_size,num_sigs)
{
  obs_fpp<-Reduce('+',random_sig_list)
  no_classes<-length(unique(ID_classes))
  row_r<-no_classes*min_sample_size
  col_q=dim(query_data)[2]

  no_cores <- parallel::detectCores() - no_cores_free

  #INITIATE CLUSTER
  cl <- parallel::makeCluster(no_cores)
  on.exit(parallel::stopCluster(cl),add=TRUE)
  #Export internal functions and variables for use by each core
  ARGS <- c('nosample', 'obs_fpp','row_r','col_q','num_sigs')
  parallel::clusterExport(cl, varlist = ARGS, env = environment())
  parLapply(cl,no_perms,test_for_ran)

}
