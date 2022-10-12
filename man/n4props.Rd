\name{n4props}
\alias{n4props}
\alias{print.n4props}
\alias{summary.n4props}
\title{Number of Subjects Required for a Cluster Randomized Trial with a Binary Outcome}

\description{
This function provides detailed sample size estimation information to determine
the number of subjects that must be enrolled in a cluster randomized trial with a binary
outcome.}

\usage{n4props(pe, pc, m, ICC, alpha=0.05, power = 0.80, AR=1, two.tailed=TRUE, digits=3)}


\arguments{
\item{pe}{The anticipated proportion of individuals with the outcome of interest in the experimental group.}
\item{pc}{The anticipated proportion of individuals with the outcome of interest in the control group.}
\item{m}{The anticipated average (or actual) cluster size.}
\item{ICC}{The anticipated value of the intraclass correlation coefficient, ICC.}
\item{AR}{The Allocation Ratio: AR$=$1 implies an equal number of subjects per treatment and control
group (maximum efficiency), AR $>$ 1, implies more subjects will be enrolled in the control group 
(e.g. in the case of costly intervention), AR $<$ 1 implies more subjects in the
treatment group (rarely used).}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{two.tailed}{Logical, If TRUE calculations are based on a two-tailed type I error,
if FALSE, a one-sided calculation is performed.}
\item{digits}{Number of digits to round calculations}
}

\details{
This function provides detailed information, similar to PROC POWER in SAS, but with less
functionality and more concise output.  It is used for sample size estimation in 
a cluster randomized trial where the outcome of interest is binary.  A simple example may include whether
an individual dies from a heart attack.  In epidemiological terms, pe and pc can be thought
of as the expected prevalence of the outcome in the experimental and control group. Note that 
if the results suggest a small number of clusters is required, an iterative
procedure will include the T distribution instead of the normal critical value for alpha, iterating
the procedure until convergence.  Thus on some occasions, the algorithm may not converge.  In some cases, such as small ICC values or proportions, this fails to converge and may need to be stopped.
}

\value{
\item{nE}{The minimum number of clusters required in the experimental group.}
\item{nC}{The minimum number of clusters required in the control group.}
\item{pe}{The anticipated proportion of individuals in the experimental group with the outcome.}
\item{pc}{The anticipated proportion of individuals in the control group with the outcome.}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{AR}{The Allocation Ratio.}
}

\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.
}

\author{Michael Rotondi, \email{mrotondi@yorku.ca}}

\seealso{\code{\link{n4means}}, \code{\link{n4incidence}}}

\examples{
\dontrun{Suppose a new drug is thought to reduce heart attack mortality from 0.10 to 0.03. 
Calculate the required number of subjects that must be enrolled in a study to detect this 
difference with alpha = 0.05 and power = 0.80.}
n4props(pe=0.03, pc=0.10, m=25, ICC=0.20, AR=1, alpha=0.05, power=0.80);
}

\keyword{design}
