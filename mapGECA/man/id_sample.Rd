% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/id_sample.R
\name{id_sample}
\alias{id_sample}
\title{Selects random columns from a matrix}
\usage{
id_sample(mat_eg, min_sample_size)
}
\arguments{
\item{mat_eg}{matrix (reference dataset).}

\item{min_sample_size}{numeric, number of samples to extract from each class (reference dataset).}
}
\value{
mat_eg[,temp ] matrix, with random samples identified.
}
\description{
Without replacement, selects columns at random
}
