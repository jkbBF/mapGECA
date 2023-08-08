## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(mapGECA)

## -----------------------------------------------------------------------------
data("query_data")
data("ref_data")

## -----------------------------------------------------------------------------
#not run
#inter<-intersect(row.names(reference),(row.names(query)))
#query_new<-query[row.names(query)%in% inter,]
#reference_new<-reference[row.names(reference)%in% inter,]

## -----------------------------------------------------------------------------

ID_classes=c(rep(1,35),rep(2,48))#ref class labels

## -----------------------------------------------------------------------------
min_sample_size=20

## -----------------------------------------------------------------------------
nosample=500# number of random gene-sets
num_sigs=100 #Usually 2,000 or more

## -----------------------------------------------------------------------------
no_cores_free <-2
random_sig_run2<-para_map(no_cores_free,1:num_sigs,query_data[], ref_data[], nosample,ID_classes, min_sample_size)

## -----------------------------------------------------------------------------
random_sig_result(random_sig_run2,ID_classes,min_sample_size,query_data)

## -----------------------------------------------------------------------------
noperms=100
random_sig_ran2<-para_ran(no_cores_free,num_sigs, random_sig_run2,query_data,ID_classes, min_sample_size,noperms)

## -----------------------------------------------------------------------------
p_value=0.05
random_sig_perm_result(p_value,random_sig_run2,random_sig_ran2,num_sigs,ID_classes,min_sample_size,query_data)


