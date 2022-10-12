\name{n4means}
\alias{n4means}
\alias{print.n4means}
\alias{summary.n4means}

\title{Number of Subjects Required for a Cluster Randomized Trial with a Continuous Outcome}

\description{
This function provides detailed sample size estimation information to determine
the number of subjects that must be enrolled in a cluster randomized trial to compare
two means.}

\usage{n4means(delta, sigma, m, ICC, alpha=0.05, power=0.8, AR=1, two.tailed=TRUE, digits=3)}

\arguments{
\item{delta}{The minimum detectable difference between population means.}
\item{sigma}{The standard deviation of the outcome.}
\item{m}{The anticipated average (or actual) cluster size.}
\item{ICC}{The anticipated value of the intraclass correlation coefficient, \eqn{\rho}.}
\item{AR}{The Allocation Ratio: AR=1 implies an equal number of subjects per treatment and control
group (maximum efficiency), AR > 1, implies more subjects will be enrolled in the control group 
(e.g. in the case of costly intervention), AR < 1 implies more subjects in the
treatment group (rarely used).}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{two.tailed}{Logical, If TRUE calculations are based on a two-tailed type I error,
if FALSE, a one-sided calculation is performed.}
\item{digits}{Number of digits to round calculations.}
}

\details{
This function provides detailed sample size information, similar to PROC POWER in SAS, but with less
functionality and more concise output, and adapted for the design of cluster
randomized trial.  It is used for sample size estimation in 
a cluster randomized trial where the outcome is continuous, e.g. blood pressure, or weight.
Note that if the results suggest a small number of clusters is required, an iterative
procedure will include the T distribution instead of the normal critical value for alpha,
iterating until convergence.  In some cases, such as small ICC values, the algorithm may fail to converge and may need to be stopped.
}

\value{
\item{nE}{The minimum number of clusters required in the experimental group.}
\item{nC}{The minimum number of clusters required in the control group.}
\item{delta}{The minimum detectable difference between population means.}
\item{sigma}{The standard deviation of the outcome.}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{AR}{The Allocation Ratio.}
}


\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.
}

\author{Michael Rotondi, \email{mrotondi@yorku.ca}}

\seealso{\code{\link{n4props}}, \code{\link{n4incidence}}}

\examples{
\dontrun{Suppose we wish to test whether a blood pressure medication reduces diastolic blood
pressure by 10 mm Hg, at standard significance and power, assume the standard deviation is 10 mm Hg.}
n4means(delta=10, sigma=1, m=25, ICC=0.05, alpha=0.05, power=0.80);
}

\keyword{design}
