#'Returns most similar matches for query samples given reference
#'
#'Compares a set of query samples against a reference dataset using random gene set
#'@param norep a numeric indicating the number of iterations.
#'@return mat_bal a matrix representing the matches of a query to a reference dataset.
#
#'@export
#'
mol_map<-function(norep)
{

  #STORE OUTPUT
  query_size=dim(query_data)[2]
  ref_size=dim(ref_data)[2]
  gene_size=dim(query_data)[1]
  no_classes<-length(unique(ID_classes))
  ref_size_balance<-no_classes*min_sample_size
  mat_bal=matrix(0,ncol=ref_size_balance,nrow=query_size);
  #SET UP BALANCED MATRIX
  mat_by_classes<-lapply( split(t(ref_data), (ID_classes) ), matrix, ncol=gene_size)
  bal_mat_by_classes<-lapply((mat_by_classes),inner_sample,min_sample_size)
  data_bal<-matrix(unlist(bal_mat_by_classes, recursive = FALSE),byrow=F,nrow=gene_size)

  #data_bal<-make_sample_df(ref_classes,ref_data,min_sample_size)
  #COMBINE QUERY+REF
  data_all=cbind(query_data,data_bal);

  #SELECT GENES RANDOM
  data_sub=data_all[sample(1:gene_size, size = nosample),];
  #COMPOSITIONAL FORM
  compo_data_sub<-compo(data_sub);
  #COMPARE
  aitch_mat<-cal_matAD(compo_data_sub[,1:query_size],compo_data_sub[,c(query_size+1):c(query_size+ref_size_balance)]);

  #DETERMINE MIN = BEST MATCH
  indexminOfRows=apply(aitch_mat, 1, function(x) which.min(x[]) );

  #INDEX
  y<-as.vector(indexminOfRows);

  #RECORD MATCH
  for(k in 1:query_size) mat_bal[k, (y[k])]=1;

  return(mat_bal)
}
