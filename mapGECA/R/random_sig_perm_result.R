#'Outputs random signature matches above estimated p-value threshold
#'
#'Filters observed random signature results using random label shuffling
#'@param p_value numeric user-defined significance level.
#'@param random_perms_result_list list of random matches over multiple iterations.
#'@param random_sig_run_list list of matches over multiple iterations.
#'@param num_sigs numeric number of iterations.
#'@param ID_classes vector of class labels.
#'@param min_sample_size numeric number of samples randomly taken from each reference class.
#'@param query_data matrix query dataset.
#
#'@return sum_res matrix representing matches per class.
#
#'@export
#'
random_sig_perm_result<-function(p_value,random_sig_run_list,random_perms_result_list,num_sigs,ID_classes,min_sample_size,query_data)
{
  query_size<-dim(query_data)[2]
  mat_sig<-Reduce('+',random_sig_run_list)
  #aggregate matches
  mat_ran<-Reduce('+',random_perms_result_list)
  #Extract significant matches
  p_rev<-(num_sigs-mat_ran)/num_sigs#equivalent of p-values

  #set up matrix for values passing p-value threshold
  threshold <- ifelse(p_rev< p_value, F, T)
  threshold_pass <- matrix(t(mat_sig)[ifelse(threshold, T, NA)], ncol = ncol(t(mat_sig)))
  threshold_pass[is.na(threshold_pass)]<-0#replaces NAs with 0

  bal_class<-sort(rep(unique(ID_classes),min_sample_size))
  split_res_ran<-lapply(split((threshold_pass), bal_class),matrix,byrow=T,nrow=query_size)
  #COMBINE BY CLASS
  sum_res_ran<-matrix(unlist(lapply(split_res_ran, rowSums)),nrow=query_size)
  colnames(sum_res_ran)<-unique(ID_classes)
  rownames(sum_res_ran)<-colnames(query_data)
  return(sum_res_ran)
}
