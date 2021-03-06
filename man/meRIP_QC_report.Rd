% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/meRIP_QC_report.R
\name{meRIP_QC_report}
\alias{meRIP_QC_report}
\title{Generate quality control report of a single MeRIP data site.}
\usage{
meRIP_QC_report(se_M, txdb = NULL, save_title = "modX",
  save_dir = save_title, gtcoord = NULL, p_threshold = NULL,
  fdr_threshold = NULL, log2FC_cutoff = 0, min_num_mod = 10000,
  save_inference_result = TRUE, GC_idx_feature = NULL,
  DM_analysis = FALSE, DM_method = "DESeq2", expected_change = NULL,
  PCA_plot = FALSE, row_minimal_counts = 10, cqn = FALSE)
}
\arguments{
\item{se_M}{A \code{SummarizedExperiment} object containing the counts of each modification sites of each bam files. Appropriate \code{colData} and \code{rowRanges} should be available.
Specifically, \code{colData} should be a \code{DataFrame} object including the following columns:

\code{SRR_RUN} : a factor variable that uniquely indentify each columns of the count matrix, could be ID for each bam files.

\code{IP_input} : a factor variable indicating whether the columns belong to IP or input, the levels need to be c("input", "IP").}

\item{txdb}{\code{TxDb} object of the corresponding \code{rowRanges}, this is either obtained from biocoductor or converted from the user provided GFF files.}

\item{save_title}{A character string indicating the header of the reports generated.}

\item{save_dir}{A character string indicating the directory to save the report, by default it is the current working directory.}

\item{gtcoord}{Optional: A variable containing guitar coordinate, which is defined by the \pkg{Guitar} package. If not provided, the guitar coordinate will be automatically generated from txdb.

Cui X, Wei Z, Zhang L, Liu H, Sun L, Zhang s, Huang Y and Meng J (2016). “Guitar: an R/Bioconductor package for gene annotation guided transcriptomic analysis of RNA related genomic features.” BioMed Research International.}

\item{p_threshold}{A numeric value between 0 to 1, it indicates the p value cut off of the statistical inference, it will be neglected if \code{fdr_threshold} is not NULL.}

\item{fdr_threshold}{A numeric value between 0 to 1, it indicates the fdr cut off of the statistical inference.

By default, \code{meRIP_QC_report} want to call DESeq2 and infer methylation under the design log2(Q) ~ intercept + I(IP).
The Wald test is conducted on the coefficient estimate of the second term I(IP).}

\item{log2FC_cutoff}{The log2 fold change cutoff of the inference result, default setting is 0.}

\item{min_num_mod}{The minimal number of sites inferred in the Methylation and Control groups, i.e.IP bigger than input and vice versa (for control), default setting is 10000.}

\item{save_inference_result}{Whether to save the result of the inference, default setting is TRUE.}

\item{GC_idx_feature}{Optional: The GC content values for each features (rows) of the count matrix.}

\item{DM_analysis}{Optional: Whether to conduct differential methylation analysis or not, default setting is FALSE.}

\item{DM_method}{Decide the statistical inference method used in differential methylation procedure. The default setting is "DESeq2"; an alternative setting is "QNB", which will use the \pkg{QNB} package to compute the differential methylation statistics.

Liu, L., et al. (2017). "QNB: differential RNA methylation analysis for count-based small-sample sequencing data with a quad-negative binomial model." Bmc Bioinformatics 18(1): 387.}

\item{expected_change}{Optional: could be either "hyper" and "hypo", indicating the expected change of treated condition over input condition, this is useful when inference of the target sites of RNA modification writers or erasers from the MeRIP Seq data. Default setting is NULL.}

\item{PCA_plot}{Whether to plot the PCA plot with DESeq2, the default setting is FALSE, it can be time consuming due to the required rlog transformation in DESeq2.}

\item{row_minimal_counts}{A non negative integer number, the methylation sites with total count (row sums) smaller than the threshold will be excluded from the statistical inference, the default setting is 10.

The row filter is recommended when dealing with sparse count matrix, it can improve the computational efficiencies of the inference process; occasionally, it can also improve the statistical power of the tests;}

\item{cqn}{indicate wheather to normalize GC content dependency of methylation / differential methylation log2FC, default is FALSE.

Select FALSE if you want to diagnose GC content batch effect.

Select TRUE if you want to send the inference result to downstream analysis.}
}
\value{
This function will generate files of quality control reports under the directory provided by \code{save_dir}
}
\description{
\code{meRIP_QC_report} is used to generate a single quality control report for a summarized experiment object of MeRIP experiment.
}
\details{
The function can generate a Quality Control report on a well formated SummarizedExperiment object containing reads count matrix and the genomic locations of each row features.
Under current version, \code{meRIP_QC_report} supports the generation of the following reports.

1. A reads number distribution plot.

2. A GC content diagnosis plot for single columns of SummarizedExperiment.

3. A methylation profile report in tabular format based on DeSeq2 result.

4. A GC content diagnosis plot for methylation sites.

5. Guitar plot for methylation sites.

6. Exon length distribution for methylation sites.
}
\examples{
meRIP_QC_report(se_M = se_mm10,
txdb = TxDb.Mmusculus.UCSC.mm10.knownGene::TxDb.Mmusculus.UCSC.mm10.knownGene,
gtcoord = Gtcoord_mm10,
min_num_mod = 1000)

#To do:
1. add QNB: done.
1.5 add 2 functions: Mod_count_denovo, Mod_count_annotation.
2. add cqn (adjust GC content) / probably add GC content adjustment for CHIP-seq (if possible).
3. add plot over-dispersion for both QNB and DESeq2.
4. change the save dir into paste, or record the original dir. (don't reset directory at final, if you cannot complete (due to middle error), you will mess up user's directory)
5. The output of the inference result could not be RDS, be a readable format such as csv.
6. If some one not provide guitar coordinate (gtcoord = NULL), make the coordinate being automatically generated from txdb....
7. Organize and merge into one html report.
8. Remove unnecessary export
9. A summarization purposed OLM on log2FC ~ GC_content_z + exon_length + stop_codon.

}
\seealso{
many.
}
