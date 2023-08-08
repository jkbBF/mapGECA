#'Outputs random signature matches
#'
#'Summarises observed random signature results
#
#'@param random_sig_input_list list of matches over multiple iterations.
#'@param classIDs vector of class labels.
#'@param min_sample_size numeric number of samples randomly taken from each reference class.
#'@param query_data matrix query dataset.
#
#'@return sum_res matrix representing matches per class.
#
#'@export
#'

random_sig_result<-function(random_sig_input_list,classIDs,min_sample_size,query_data)
{
  query_size<-dim(query_data)[2]
  #ADD TOGETHER LIST ELEMENTS
  random_sig_res<-Reduce("+",random_sig_input_list)

  #FINAL SUMMARY
  #IDS for balanced training set
  bal_class<-sort(rep(unique(classIDs),min_sample_size))
  #Split list results by class
  split_res<-lapply(split(t(random_sig_res), bal_class),matrix,byrow=T,nrow=query_size)
  #Summarise results
  sum_res<-matrix(unlist(lapply(split_res, rowSums)),nrow=query_size)
  colnames(sum_res)<-unique(classIDs)
  rownames(sum_res)<-colnames(query_data)
  return(sum_res)
}
