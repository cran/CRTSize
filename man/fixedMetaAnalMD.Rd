\name{fixedMetaAnalMD}
\alias{fixedMetaAnalMD}
\alias{print.fixedMetaAnalMD}
\alias{summary.fixedMetaAnalMD}
\title{Fixed Effects Meta-Analysis for Mean Differences}

\description{
This function performs a fixed effects meta-analysis of mean differences (a continuous effect measure) from a matrix of mean differences, lower and upper confidence limits.}

\usage{fixedMetaAnalMD(data, alpha=0.05)}


\arguments{
\item{data}{A matrix with individual studies in each row.  The first column contains the estimate of the Mean Difference (Treatment - Control), the second column contains the lower 95 \% confidence limit and the third contains the 95 \% upper limit.  For simplicity, this function assumes that each of the inputed lower and upper limits that are 95 \% confidence limits.}
\item{alpha}{The desired type I error rate for calculation of confidence limits for the fixed effects mean difference.}
}

\details{
This function performs an elementary fixed effects meta-analysis of continous
outcome measures from an input matrix of mean differences and their respective confidence limits for
any number of studies.  This function is designed for use with \code{\link{n4meansMeta}}
to provide sample size estimation based on an updated meta-analysis.  Note that 
it is assumed that the 95 \% confidence limits are correctly calculated, and that this 
function, being elementary in nature only accepts the mean difference as the effect measure.  
Additional utilities for a meta-analysis or meta-regression can be found in Viechbauer (2006).}

\value{
\item{data}{The data matrix is returned.}
\item{thetaF}{The fixed effects outcome measure, the mean difference.}
\item{lF}{The 100(1 - \eqn{\alpha}) \% lower limit of the pooled mean difference.}
\item{uF}{The 100(1 - \eqn{\alpha}) \% upper limit of the pooled mean difference.}
\item{Var}{The variance of the fixed effects treatment mean difference.}
\item{Sig}{Does this show a statistically significant benefit or harm? (Binary: zero (nonsignificant) or one (significant)).}
\item{alpha}{The desired type I error rate.}
}

\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.

White IR and Thomas J.  Standardized mean differences in individually-randomized and cluster-randomized trials, with applications to meta-analysis.  Clinical Trials 2005. 2:141-151.

Viechtbauer, W.  Metafor: A meta-analysis package for R.  2010.  Available at: http://www.metafor-project.org/
}

\author{Michael Rotondi, \email{mrotondi@uwo.ca}}

\seealso{\code{\link{fixedMetaAnalRROR}}, \code{\link{n4meansMeta}}}

\examples{
fixedMetaAnalMD(data=rbind(c(100, 50, 150), c(25, -100, 150), c(-90, -190, 10), 
c(-125, -200, -50)), alpha=0.05);
}

\keyword{models}
