\name{simMatSmall}
\alias{simMatSmall}

\title{
A Resnik Similarity Matrix.
}

\description{
A Resnik Similarity Matrix (normalized) for 2000 human genes sampled from 14173 annotated human genes.
}

\details{
The similarity matrix was computed using the R package csbl.go (http://csbi.ltdk.helsinki.fi/csbl.go/), using a GO term specificity table computed using  GO BP annotations for all human Entrez Genes available in the Bioconductor package org.Hs.eg.db, version 2.6.4 (not the default table provided csbl.go).
}

\note{
This matrix is provided for test-running GOGANPA only. Although it is sampled from the similarity matrix used in Chang et. al. (2012), it cannot be used to reproduce the results presented in Chang et. al. (2012).
}

\references{
Ovaska, K, Laakso M, and Hautaniemi, S. (2008) Fast Gene Ontology based clustering for microarray experiments. BioData Mining. 1:11.

Chang, B., Kustra, R. and Tian, WD (2012) Functional-Network-based Gene Set Analysis using Gene Ontology. Submitted.
}

\author{
Billy Chang
}

\examples{
#Not to Run
data("simMatSmall",package='GOGANPA')
}
