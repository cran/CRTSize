\name{fixedMetaAnalRROR}
\alias{fixedMetaAnalRROR}
\alias{print.fixedMetaAnalRROR}
\alias{summary.fixedMetaAnalRROR}
\title{Fixed Effects Meta-Analysis for Relative Risks/Odds Ratios}

\description{
This function provides a detailed fixed effects meta-analysis of relative
risks/odds ratios from a matrix of effect measures, lower and upper confidence limits.}

\usage{fixedMetaAnalRROR(data, alpha=0.05)}

\arguments{
\item{data}{A matrix with individual studies in each row.  The first column contains the estimate
of the relative risk/odds ratio, second column contains the 95 \% lower limit and the third contains the 95 \% upper limit.}
\item{alpha}{The desired type I error rate for calculation of confidence limits for the
pooled fixed effects measure.  For simplicity, this function assumes that each of the inputed lower
and upper limits are 95 \% confidence limits.}
}

\details{
This function performs an elementary fixed effects meta-analysis of relative risks/odds ratios
from an input matrix of relative risks and their respective confidence limits for
any number of studies.  This function is designed to be used in conjunction with \code{\link{n4propsMeta}}
in order to provide a sample size calculation based on an updated meta-analysis.  Note that
this function works on the log scale to calculate variances and the pooled effect measure.  Additional utilities
for a meta-analysis or meta-regression can be found in Viechbauer (2006).}

\value{
\item{data}{The data matrix is returned.}
\item{thetaF}{The fixed effects Log Relative Risk (RR)/Odds Ratio (OR).}
\item{lF}{The 100(1 - \eqn{\alpha}) \% lower limit of the pooled Log RR/OR.}
\item{uF}{The 100(1 - \eqn{\alpha}) \% upper limit of the pooled Log RR/OR.}
\item{Var}{The variance of the Log RR/OR.}
\item{Sig}{Is the result statistically significant (Binary zero or one)?}
\item{alpha}{The desired type I error rate.}
}

\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.

Viechtbauer, W.  Metafor: A meta-analysis package for R.  2010.  Available at: http://www.metafor-project.org/
}

\author{Michael Rotondi, \email{mrotondi@uwo.ca}}

\seealso{\code{\link{fixedMetaAnalMD}}, \code{\link{n4propsMeta}}}

\examples{
fixedMetaAnalRROR(data=rbind(c(0.672, 0.342, 1.321), c(0.942, 0.761, 1.165), c(1.228, 0.384, 3.934)), 
alpha=0.05);
}

\keyword{models}
