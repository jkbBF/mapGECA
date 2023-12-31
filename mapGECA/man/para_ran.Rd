% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/para_ran.R
\name{para_ran}
\alias{para_ran}
\title{Returns most similar matches for query samples given reference (parallel)}
\usage{
para_ran(
  no_cores_free = 2,
  no_perms,
  random_sig_list,
  query_data,
  ID_classes,
  min_sample_size,
  num_sigs
)
}
\arguments{
\item{no_cores_free}{numeric, keeps cores free on user's machine, default=2.}

\item{no_perms}{numeric, the number of iterations.}

\item{random_sig_list}{list, output from para_map()}

\item{query_data}{matrix, a query dataset.}

\item{ID_classes}{vector of class labels.}

\item{min_sample_size}{numeric user-defined, number of samples from each reference dataset to be sampled.}

\item{num_sigs}{user-defined =number signatures used.}
}
\value{
list
}
\description{
Compares a set of query samples against a reference dataset using random gene sets
Exports inner functions and variables to each core
}
