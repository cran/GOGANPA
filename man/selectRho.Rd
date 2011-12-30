\name{selectRho}
\alias{selectRho}

\title{
Choosing a threshold based on the Scale-Free-Topology-Criterion
}
\description{
Determine the threshold parameter which will result in a network with optimal scale-free fitness.
}
\usage{
selectRho(simMat, rhovec = NULL)
}

\arguments{
  \item{simMat}{
The GO-similairty matrix. Missing and negative entries are not allowed. The gene names should be assigned to the row and column names.
}
  \item{rhovec}{
a vector of candidate thresholds, or if NULL, a set of thresholds chosen according to the range of the similarity matrix.
}
}

\details{
The scale-free fitness measure is based on linear-regression-based R-squared goodness-of-fit measure. 
}

\value{
A list, with elements:
  \item{criterion }{a summary table of the candidate thresholds' resulting fits.}
  \item{bestrho }{The candidate threshold with the highest R-squared.}
}

\references{
Chang, B., Kustra, R. and Tian, WD (2012) Functional-Network-based Gene Set Analysis using Gene Ontology. Submitted.

Zhang, B. and Horvath, S. (2005) A General Framework for Weighted Gene Co-Expression Network Analysis. Statistical Applications in Genetics and Molecular Biology. 4:1:A17.
}

\author{
Billy Chang
}

\note{
Note that certain GO-similarity measures are unbounded (e.g. the Resnik similarity). This code will not normalize the similarity matrix, and rhovec, if supplied, should be chosen according to the range of the GO-similarity values inside simMat. 
}

\seealso{
\code{\link{getGNET}}
}

\examples{
#Not to Run
data("simMatSmall",package="GOGANPA")
fit <- selectRho(simMatSmall)
plot(fit$criterion[,1],fit$criterion[,2])
abline(v=fit$bestrho,col=2)
}
