% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plot_GC_columns.R
\name{Plot_GC_columns}
\alias{Plot_GC_columns}
\title{Plot GC content distribution of features by columns.}
\usage{
Plot_GC_columns(SE_M, GC_IDX, HDER, ANNOT = F)
}
\arguments{
\item{SE_M}{A \code{SummarizedExperiment} object with 2 necessary columns in \code{colData}: c( "IP_input", "SRR_RUN" ).}

\item{GC_IDX}{A numeric vector indicate the GC content of each individual feature.}

\item{HDER}{Determine the content of the title and the file name of the plot saved.}

\item{ANNOT}{Whether annotate the plot with additional batch or treatment information,
in this version, it depends on the column of c("Perturbation_detail") in the \code{colData}.}
}
\value{
A pdf diagram saved under the current working directory.
}
\description{
\code{Plot_Seq_depth} is an internal function used to generate a GC content distribution plot given an input \code{SummarizedExperiment} object.
}
