\name{n4incidence}
\alias{n4incidence}
\alias{print.n4incidence}
\alias{summary.n4incidence}
\title{Number of Subjects Required for a Cluster Randomized Trial Comparing Incidence Rates}

\description{
This function provides detailed sample size estimation information to determine
the number of subjects that must be enrolled in a cluster randomized trial to test for a significant
difference in incidence rates.}

\usage{n4incidence(le, lc, m, t, CV, alpha=0.05, power = 0.80, AR=1, two.tailed=TRUE, digits=3)}

\arguments{
\item{le}{The anticipated incidence rate, \eqn{\lambda_E}, in the experimental group with the outcome.}
\item{lc}{The anticipated incidence rate, \eqn{\lambda_C}, in the control group with the outcome.}
\item{m}{The anticipated average (or actual) cluster size.}
\item{t}{The planned follow-up time for the study (in weeks, months, etc.)}
\item{CV}{The coefficient of variation, assumed constant over both the treatment and control groups.
Note that CV = \eqn{\sigma_1/\lambda_E = \sigma_2/\lambda_C}, where \eqn{\sigma_E} and \eqn{\sigma_C} represent the between-cluster variation in incidence rates for each group.}
\item{AR}{The Allocation Ratio: AR\eqn{=}1 implies an equal number of subjects per treatment and control
group (maximum efficiency), > 1, implies more subjects will be enrolled in the control group 
(e.g. in the case of costly intervention), < 1 implies more subjects in the
tretment group (rarely used).}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power, recall power = 1 - type II error.}
\item{two.tailed}{Logical, If TRUE calculations are based on a two-tailed type I error,
if FALSE, a one-sided calculation is performed.}
\item{digits}{Number of digits to round calculations.}
}

\details{
This function provides detailed information, similar to PROC POWER in SAS, but with less
functionality and more concise output.  It is used for sample size estimation in 
a cluster randomized trial where the outcome of interest is an incidence rate.  A simple example may include 
whether a new treatment can successfully reduce the incidence of heart attacks over a six month period.  
In epidemiological terms, \eqn{\lambda_E} and \eqn{\lambda_C} are the expected incidence rate of the outcome in the experimental and control group. Note that if the results suggest a small number of clusters is required, an iterative
procedure will include the T distribution instead of the normal critical value for alpha, iterating
until convergence.  In some cases, such as small ICC values, the algorithm may fail to converge and may need to be stopped.
}

\value{
\item{le}{The anticipated incidence rate, \eqn{\lambda_E}, in the experimental group with the outcome.}
\item{lc}{The anticipated incidence rate, \eqn{\lambda_C}, in the control group with the outcome.}
\item{m}{The anticipated average (or actual) cluster size.}
\item{t}{The planned follow-up time for the study.}
\item{CV}{The coefficient of variation.}
\item{AR}{The Allocation Ratio: One implies an equal number of subjects per treatment and control groups.}
\item{alpha}{The desired type I error rate.}
\item{power}{The desired level of power.}
\item{AR}{The Allocation Ratio.}
}

\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.
}

\author{Michael Rotondi, \email{mrotondi@yorku.ca}}

\seealso{\code{\link{n4means}}, \code{\link{n4props}}}

\examples{
\dontrun{
Suppose a new drug is thought to reduce the incidence of HIV from 0.01 per person-year to 0.005
per person-year. Assume the coefficient of variation is 0.25 and that 1000 subjects will be 
followed for a two year period.  Calculate the required number of subjects that must be enrolled 
in a study to detect this difference with alpha = 0.05 and power = 0.80.
}
n4incidence(le=0.01, lc=0.005, m=1000, t=2, CV=0.25);
}


\keyword{design}
