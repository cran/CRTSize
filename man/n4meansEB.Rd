\name{n4meansEB}
\alias{n4meansEB}
\alias{print.n4meansEB}
\alias{summary.n4meansEB}
\title{Number of Subjects Required for a Cluster Randomized Trial with a Continuous Outcome Using Empirical Smoothing}

\description{
This function provides detailed sample size estimation information to determine
the required number of clusters that must be enrolled in a cluster randomized trial using the
empirical smoothing density for the ICC.
The method applies a smoothed density function (including optional weighting) to obtain
an empirical distribution for the ICC.  Output includes quantiles of values of the
required number of clusters to obtain a prespecified power level.  This version assumes
the outcome of interest is continuous.}

\usage{n4meansEB(ICC, varICC=0, delta, from, to, sigma, m, iter=1000, alpha=0.05, power=0.8, 
two.tailed=TRUE, digits=3, plot=TRUE)
}

\arguments{
\item{ICC}{A vector of possible ICC values, obtained from a reasonable number of independent
studies.  These values form the basis of the empirical density function for the ICC.}
\item{varICC}{A vector of variances of the ICC estimates.  In some cases, it may be desirable
to give greater weight (smaller variances) to estimates of the ICC that are obtained from larger
samples.  The default value is zero, which implies that all estimates are weighted equally.}
\item{delta}{The anticipated mean difference in the planned study.}
\item{from}{A lower limit representing the lowest plausible value for the ICC.  This is used 
in the estimation of the ICC's empirical density function. The default value is zero as the ICC is assumed
to be non-negative.}
\item{to}{An upper bound for the plausible range of the ICC.  A default value is not specified as this
may range depending on the circumstances.}
\item{sigma}{The anticipated variance in each group.}
\item{m}{The anticipated average (or actual) cluster size.}
\item{iter}{The total number of iterations.}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{two.tailed}{Logical, If TRUE calculations are based on a two-tailed type I error,
if FALSE, a one-sided calculation is performed.}
\item{digits}{Number of digits to round calculations.}
\item{plot}{Logical: Would you like a plot of the estimated density of the ICC and Histogram?}
}

\details{
This function estimates an empirical density for the ICC using the Gaussian kernel.  Weights
can be incorporated through the use of the varICC parameter.
Values are sampled from this empirical density a large (iter) number of times and the
resulting number of clusters that must be randomized to achieve a pre-specified power level
is then calculated.  The resulting output is the quantiles of the required number of clusters,
illustrating the most likely values of the ICC and number of clusters required.  Additional
details are in Rotondi and Donner (2009).}


\value{
\item{ResRho}{A vector of values of sampled values of the ICC.  This is of length iter.}
\item{ResK}{A vector of values of the required number of clusters k, using the 
ICC values in ResRho.  This is also of length iter.}
\item{pe}{The anticipated proportion of individuals in the experimental group with the outcome.}
\item{pc}{The anticipated proportion of individuals in the control group with the outcome.}
\item{ICC}{The specified vector of values for the ICC.}
\item{varICC}{A vector of variances of the ICC (study weights).}
\item{from}{Lower bound in the ICC density estimation.  Default of zero.}
\item{to}{Upper bound in ICC Density Estimation.}
\item{m}{The size of each cluster.}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{two.tailed}{TRUE or FALSE; Depending on whether the alpha level is one or two sided.}
\item{digits}{Number of digits to round results.}
}


\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.

Rotondi M and Donner A.  (2009) Sample Size Estimation in Cluster Randomized Trials: An Empirical Bayes Approach, Journal
of Educational and Behavioral Statistics, 34:229-237. 
}

\author{Michael Rotondi, \email{mrotondi@yorku.ca}}

\seealso{\code{\link{n4propsEB}}}

\examples{
\dontrun{ICC values are from Rotondi and Donner (2009).  Suppose classrooms of size 25 are randomized 
with hypothetical experimental rates of 0.05 and control rates of 0.18.  Plots are suppressed, 
and iter = 50 for testing purposes.}
n4meansEB(delta=0.5, sigma=1, m=25, ICC=c(0.162, 0.205, 0.234, 0.253), 
varICC= c(0.030, 0.032, 0.010, 0.026)^2, from=0.15, to=0.28, iter=50, plot=FALSE);
}

\keyword{design}
