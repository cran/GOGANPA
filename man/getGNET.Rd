\name{getGNET}
\alias{getGNET}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Gene Network Construction by Similarity-Thresholding
}
\description{
Construct a gene network by linking gene-pairs with GO similarity above a chosen threshold.
}
\usage{
getGNET(simMat, rho)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{simMat}{
The GO-similairty matrix. Missing and negative entries are not allowed. The gene names should be assigned to the row and column names.
}
  \item{rho}{
The threshold, chosen e.g. by \code{selectRho}. Gene-pairs with similarity above the threshold will be linked.
}
}
\note{
Note that certain GO-similarity measures are unbounded (e.g. the Resnik similarity). This code will not normalize the similarity matrix, and rho should therefore be chosen according to the range of the GO-similarity values inside simMat. 
}
\value{
A list, where each element contains the names of the genes connected to the corresponding gene indicated by the element-header.
}
\author{
Billy Chang
}

\references{
Chang, B., Kustra, R. and Tian, WD (2012) Functional-Network-based Gene Set Analysis using Gene Ontology. Submitted.

Zhang, B. and Horvath, S. (2005) A General Framework for Weighted Gene Co-Expression Network Analysis. Statistical Applications in Genetics and Molecular Biology. 4:1:A17.
}

\seealso{
\code{\link{selectRho}}
}

\examples{
#Not to Run
data("simMatSmall",package="GOGANPA")
gNET <- getGNET(simMatSmall,rho=0.7)
hist(sapply(gNET,length)) # network connectivities (excluding unconnected genes)

}