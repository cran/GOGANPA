\name{GOGANPA}
\alias{GOGANPA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
GO-based Gene-Set-Analysis
}
\description{
A Gene-Set-Analysis method that accounts of functional-linkages among Genes, as indicated by a GO-functional network constructed from a GO-similarity matrix.}
\usage{
GOGANPA(gExprs.obj, gsets, gNET = NULL, simMat = NULL, rho = NULL, msp.groups, 
check.exprs = TRUE, msp.correction = TRUE, size.min = 15, size.max = 500, 
permN = 2000, randN = 30, permFDR.cutoff = 0.15, output.label = "GOGANPAResult")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{gExprs.obj}{
Gene expression experiment data object
}
  \item{gsets}{
A list of gene sets.
}
  \item{gNET}{
A gene association network stored in a list.
}
  \item{simMat}{
The GO-similairty matrix. Missing and negative entries are not allowed. The gene names should be assigned to the row and column names.
}
  \item{rho}{
The threshold, chosen e.g. by \code{selectRho}. If NULL, then chosen automatically by \code{selectRho}.
}
  \item{msp.groups}{
A list of multi-subunit-proteins-coding genes.
}
  \item{check.exprs}{
Logical (TRUE by default). Check and correct the missing values and scaling in the gExprs.obj. If the scale is natural, it will be converted to log2.
}
  \item{msp.correction}{
Logical (TRUE). Whether to do a correction for multi-subunit proteins in gene weighting.
}
  \item{size.min}{
Minimum size of gene sets used for analysis. By default 15 genes.
}
  \item{size.max}{
Maximum size of gene sets used for analysis. By default 500 genes.
}
  \item{permN}{
Sample permutation times. By default 2000 times.
}
  \item{randN}{
Gene randomization times. Can be set smaller (say, 30) if you do not care randomization-based significance so as to be faster.
}
  \item{permFDR.cutoff}{
Sample permutation FDR cutoff. A number between 0 and 1. Set it larger if wish to see the significance of more gene sets.
}
  \item{output.label}{
A label to name output files.
}
}
\details{
Exactly one of gNET and simMat must be NULL. If simMat and rho are provided, \code{getGNET} will be called to obtain the gene network. If simMat is provided but rho is missing, then \code{selectRho} will also be called to provide an automatic choice of rho. This code is based on GANPA (Fang et. al. 2011), the gene network, gNET, whether supplied or derived from simMat, will be fed into \code{GSE.Test.Main} in the package GANPA for weighted Gene-Set-Analysis.
}
\value{
A .csv file containing various statistics.
}
\references{
Chang, B., Kustra, R. and Tian, WD (2012) Functional-Network-based Gene Set Analysis using Gene Ontology. Submitted.

Fang, ZY, Tian, WD, and Ji, HB. (September 6, 2011) A network-based gene-weighting approach for pathway analysis. Cell Research. Advanced Publication.
}
\author{
Billy Chang
}

\seealso{
\code{\link{getGNET}}, \code{\link{selectRho}}
}
\examples{
#Not to Run
require(GANPA)
data("simMatSmall",package="GOGANPA")
data("gExprs.p53", "gsets.msigdb.pnas", "msp.groups", package="GANPAdata")
set.seed(1000)
GOGANPA(gExprs.obj=gExprs.p53, gsets=gsets.msigdb.pnas, gNET=NULL, simMat=simMatSmall, rho=NULL,
                    msp.groups=msp.groups, check.exprs=TRUE, msp.correction=TRUE,
                    size.min=15, size.max=500, permN=2000, randN=30,
                    permFDR.cutoff=0.15,output.label="GOGANPAResult")
}
