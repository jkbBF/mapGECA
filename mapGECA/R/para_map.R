#'Returns most similar matches for query samples given reference (parallel)
#'
#'Compares a set of query samples against a reference dataset using random gene sets
#'Exports inner functions and variables to each core
#'@param no_cores_free numeric, keeps cores free on user's machine, default=2.
#'@param norep numeric, the number of iterations.
#'@param query_data matrix, a query dataset.
#'@param ref_data matrix, a reference dataset.
#'@param nosample numeric, number of genes to randomly sample, usually n = 500.
#'@param ID_classes vector of class labels.
#'@param min_sample_size numeric user-defined, number of samples from each reference dataset to be sampled.
#'@return list
#
#'@export
#'

para_map<-function(no_cores_free=2,norep,query_data,ref_data, nosample, ID_classes,min_sample_size)
{
  no_cores <- parallel::detectCores() - no_cores_free

  #INITIATE CLUSTER
  cl <- parallel::makeCluster(no_cores)
  on.exit(parallel::stopCluster(cl),add=TRUE)
  #Export internal functions and variables for use by each core
  ARGS <- c("mol_map","cal_matAD","id_sample","inner_sample","aitch2","compo",'nosample','query_data','ref_data','min_sample_size','ID_classes')
  parallel::clusterExport(cl, varlist = ARGS, env = environment())
  parLapply(cl,norep,mol_map)
}
