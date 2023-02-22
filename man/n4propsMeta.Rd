\name{n4propsMeta}
\alias{n4propsMeta}
\alias{print.n4propsMeta}
\alias{summary.n4propsMeta}
\title{Empirical Power and Variance Reduction of an Updated Fixed Effects Meta-Analysis with Binary Outcomes}

\description{
This function provides the empirical power/variance reduction of an updated meta-analysis for
a vector of the number of clusters to randomize per group and a vector of estimates
of the ICC with a binary outcome measured using the (log) relative risk or odds ratio.}

\usage{n4propsMeta(data, measure="RR", model="fixed", k, ICC, ICCDistn="unif", 
lower=0, upper=0.25, varRed=FALSE, m, sdm, pC, sdpC, iter=1000, alpha=0.05)}


\arguments{
\item{data}{A matrix with completed studies in each row.  The first column contains the estimate
of the relative risk or odds ratio, the second column contains the 95 \% lower limit and the third contains the 95 \% upper limit.  Note that the variance is estimated from the upper bound of these confidence intervals and risk differences are not permitted.}
\item{measure}{Corresponds to the effect measure.  Can be one of "RR" or "OR", corresponding to the Relative Risk or Odds Ratio.}
\item{model}{One of fixed or random, corresponding to the fixed or random effects meta-analysis models.  Note that the random effects model is estimated according to the DerSimonian-Laird estimate of the between-study variance.}
\item{k}{A vector of the potential number of clusters to randomize to each of the treatment and control
groups.  Note that this function assumes an equal allocation to treatment and control group status.}
\item{ICC}{A vector of potential values of the ICC, these can be obtained from the literature, pilot studies, etc.}
\item{ICCDistn}{The hypothetical distribution of the ICC values.  This can be set to "fixed" (note that only one ICC value is accepted for this option), "unif" on the range [lower, upper], "normal", corresponding to the truncated
normal distribution (Turner et al, 2004), and "smooth" corresponding to the empirical smoothing option (Rotondi and Donner, 2009).}
\item{lower}{The lower bound for the smoothing or unif options.  Default value is zero.}
\item{upper}{The upper bound for the smoothing or unif options.  Default value is 0.25.}
\item{varRed}{Logical; If varRed is set to TRUE, the proportionate reduction of variance is displayed
for the fixed effects meta-analysis.}
\item{m}{The mean cluster size.}
\item{sdm}{The standard deviation of the mean cluster size.  This adds additional real-world variation
in the simulated study, using a normal model for large cluster sizes.}
\item{pC}{The anticipated event in the control group.  The anticipated treatment event is calculated
from the simulated effect size of the preliminary meta-analysis.}
\item{sdpC}{The standard deviation of the control rate.  This is to generate real-world variation
in the simulated study and can be precise or imprecise depending on the investigators preference.}
\item{iter}{The number of iterations for each value of k and the ICC.  This has a large impact
on computational time.  Default is 1000.}
\item{alpha}{The desired type I error rate for calculation of confidence limits for the
meta-analysis model.  Note that for simplicity, this function assumes that each of the inputed lower
and upper limits are 95 \% confidence limits and this cannot be changed.}
}

\details{
This function calculates the empirical power of an updated meta-analysis by a generalization
of Sutton et al. (2007) to the context of cluster randomized trials with
a binary outcome.  The procedure is summarized in the accompanying manuscript (Rotondi and Donner, 2012).  In short,
a hypothetical new study of a given size is simulated, then added to the meta-analysis.  The
results are re-meta-analyzed and it is verified whether the pooled result is statistically significant,
or the appropriate reduction in variance of the pooled effect measure is recorded.  Note
that the proportion of variance reduction and power may not always (strictly) decrease with k, as the simulation
exhibits individual-level variation.  In addition, the random effects model does not guarantee that future studies will result in higher power due to the presence of between-study heterogeneity.}

\value{
\item{power}{The power of the updated meta-analysis.  Presented as a vector 
corresponding to the number of clusters.}
\item{varianceReduction}{The proportionate reduction in variance for the number of clusters in the fixed effects meta-analysis.}
\item{m}{The mean cluster size.}
\item{data}{The data matrix is returned.}
\item{newMean}{The preliminary fixed (or random) effects log relative risk (RR) or odds ratio (OR).}
\item{newVar}{The variance of the preliminary fixed (or random) effects log RR or log OR.}
\item{lF}{The 100(1 - \eqn{\alpha}) \% lower limit of the log RR/log OR in the original meta-analysis.}
\item{uF}{The 100(1 - \eqn{\alpha}) \% upper limit of the log RR/log OR in the original meta-analysis.}
\item{Var}{The variance of the updated log RR/log OR.}
\item{k}{The number of clusters randomized per group (vector).}
\item{ICC}{A vector of ICC values.}
\item{ICCDistn}{The distributional assumption about the ICC.}
\item{varRed}{Variance Reduction: Logical.}
\item{sdm}{The standard deviation of the mean cluster size.}
\item{pC}{The mean control rate.}
\item{sdpC}{The standard deviation of the control rate.}
\item{alpha}{The desired type I error rate.}
\item{iter}{The total number of iterations.}
}

\references{
Matthews JNS.  Introduction to Randomized Controlled Clinical Trials (2nd Ed.) Chapman & Hall: New York, 2006.

Donner A and Klar N.  Design and Analysis of Cluster Randomization Trials in Health Research.  Arnold: London, 2000.

Sutton AJ et al. (2007) Evidence-based sample size calculations based upon updated meta-analysis. Statistics in Medicine,
26(12):2479-2500.

Turner R et al. (2004) Allowing for imprecision in the intracluster correlation coefficient in the design of cluster randomized trials.  Statistics in Medicine, 23(8):1195-1214.

Rotondi M and Donner A.  (2009) Sample Size Estimation in Cluster Randomized Trials: An Empirical Bayes Approach. Journal
of Educational and Behavioral Statistics, 34:229-237.  

Rotondi M and Donner A.  (2012) Sample Size Estimation in Cluster Randomized Trials:
An Evidence-Based Perspective.  Computational Statistics and Data Analysis  56:1174-1187.
}

\author{Michael Rotondi, \email{mrotondi@yorku.ca}}

\seealso{\code{\link{n4meansMeta}} }

\examples{
\dontrun{A brief example with 10 iterations and a simple initial meta-analysis 
of two studies with the following RRs and CIs:}
n4propsMeta(data=rbind(c(0.800, 0.551, 1.162), c(0.690, 0.342, 1.390)), 
model="fixed", measure="RR", k=c(20, 40, 60, 80, 100), ICC=0.011, 
m=100, sdm=0, pC=0.1, sdpC=0, iter=10, alpha=0.05, ICCDistn="fixed");
}

\keyword{design}