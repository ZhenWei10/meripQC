#' @title Count aligned reads of meRIP-seq data
#'
#' @description \code{meRIP_count_annotation} is used to count bam files of the meRIP-seq data, the ranges of methylation is either user provided or comming from the regions derived from peak calling.
#'
#' @details This function will count reads of meRIP-seq against a user defined annotation of the modification; alternatively, the count can be conducted on de-novo generated regions reported by peak calling algorithm.
#'
#' For m6A RNA modification, the recommended annotations are m6A sites collected by MeT-DB and RMBase; the annotations from the single based resolution data (miCLIP or m6A-CLIP) are also recommended.
#'
#' @seealso \code{\link{meRIP_QC_report}}
#'
#' @param bam_IP A character vector of the bam file directories for (control) IP samples.
#' @param bam_input A character vector of the bam file directories for (control) input samples.
#' @param bam_IP_treated A character vector of the bam file directories for treated IP samples. Default setting is NULL.
#' @param bam_input_treated A character vector of the bam file directories for treated input samples. Default setting is NULL.
#'
#' The above 2 arguments should be filled only when conducting the differential methylation analysis.
#'
#' @param annotation_gr A \code{GenomicRanges} object containing the annotation of the methylation.
#' @param GFF_dir A character vector containing the directory to GFF files.
#' @param txdb A txdb object containing the genome's transcript annotation.
#'
#' If one of the above 2 arguments is filled, the count will based on the peaks generated by \pkg{exomePeak} under default setting.
#'
#' @param bin_width The bin width used when count the reads, default setting is 100, the bin is only resized when using user provided annotation.
#' @param sample_detail A character vector containing the details of the treatment or batch information, the length and order should correspond to the bam files input of the previous arguments. (Optional)
#'
#'
#' @return This function will return a \code{SummarizedExperiment} object, which is the input of the downstream QC analysis by \code{\link{meRIP_QC_report}}.
#'
#' @examples
#'
#' #For methylation:
#' meRIP_count_annotation(
#' bam_IP = c("./Control_IP_rep1.bam","./Control_IP_rep2.bam"),
#' bam_input = c("./Control_input_rep1.bam","./Control_input_rep2.bam"),
#' annotation_gr = RMBase2_mm10_gr,
#' sample_detail = c("sh-control","sh-control","sh-control","sh-control"),
#' bin_width = 100
#' )
#'
#' #For differential methylation:
#' meRIP_count_annotation(
#' bam_IP = c("./Control_IP_rep1.bam","./Control_IP_rep2.bam"),
#' bam_input = c("./Control_input_rep1.bam","./Control_input_rep2.bam"),
#' bam_IP_treated = c("./Treated_input_rep1.bam","./Treated_input_rep2.bam"),
#' bam_input_treated = c("./Treated_input_rep1.bam","./Treated_input_rep2.bam"),
#' annotation_gr = RMBase2_mm10_gr,
#' sample_detail = c("sh-control","sh-control","sh-control","sh-control","FTO-ko","FTO-ko","FTO-ko","FTO-ko"), #Label what ever you want by the order of the samples.
#' bin_width = 100
#' )
#'
#' @import GenomicAlignments
#' @import exomePeak
#' @export

meRIP_count <- function(bam_IP, bam_input, bam_IP_treated = NULL, bam_input_treated = NULL, annotation_gr = NULL, bin_width = 100, sample_detail = NULL) {

}
