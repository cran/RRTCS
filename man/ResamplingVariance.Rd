% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ResamplingVariance.R
\name{ResamplingVariance}
\alias{ResamplingVariance}
\title{Resampling variance of randomized response models}
\usage{
ResamplingVariance(output,pi,type=c("total","mean"),option=1,N=NULL,pij=NULL,str=NULL,
clu=NULL,srswr=FALSE)
}
\arguments{
\item{output}{output of the qualitative or quantitative method depending on the variable of interest}

\item{pi}{vector of the first-order inclusion probabilities. By default it is NULL}

\item{type}{the estimator type: total or mean}

\item{option}{method used to calculate the variance (1: Jackknife, 2: Escobar-Berger, 3: Campbell-Berger-Skinner). By default it is 1}

\item{N}{size of the population}

\item{pij}{matrix of the second-order inclusion probabilities. This matrix is necessary for the Escobar-Berger and Campbell-Berger-Skinner options. By default it is NULL}

\item{str}{strata ID. This vector is necessary for the Jackknife option. By default it is NULL}

\item{clu}{cluster ID. This vector is necessary for the Jackknife option. By default it is NULL}

\item{srswr}{variable indicating whether sampling is with replacement. By default it is NULL}
}
\value{
The resampling variance of the randomized response technique
}
\description{
To estimate the variance of the randomized response estimators using resampling methods.
}
\details{
Functions to estimate the variance under stratified, cluster and unequal probability sampling by resampling methods (Wolter, 2007).
The function ResamplingVariance allows us to choose from three models:

- The Jackknife method (Quenouille, 1949)

- The Escobar-Berger method (Escobar and Berger, 2013)

- The Campbell-Berger-Skinner method (Campbell, 1980; Berger and Skinner, 2005).

The Escobar-Berger and Campbell-Berger-Skinner methods are implemented using the functions defined in samplingVarEst package:

VE.EB.SYG.Total.Hajek, VE.EB.SYG.Mean.Hajek;

VE.Jk.CBS.SYG.Total.Hajek, VE.Jk.CBS.SYG.Mean.Hajek

(see López, E., Barrios, E., 2014, for a detailed description of its use).

Note: Both methods require the matrix of the second-order inclusion probabilities. When this matrix is not an input, the program will give a warning and, by default, a jackknife
method is used.
}
\examples{
N=417
data(ChaudhuriChristofidesData)
dat=with(ChaudhuriChristofidesData,data.frame(z,Pi))
mu=c(6,6)
sigma=sqrt(c(10,10))
cl=0.95
data(ChaudhuriChristofidesDatapij)
out=ChaudhuriChristofides(dat$z,mu,sigma,dat$Pi,"mean",cl,pij=ChaudhuriChristofidesDatapij)
out
ResamplingVariance(out,dat$Pi,"mean",2,N,ChaudhuriChristofidesDatapij)

#Resampling with strata
data(EichhornHayreData)
dat=with(EichhornHayreData,data.frame(ST,z,Pi))
mu=1.111111
sigma=0.5414886
cl=0.95
out=EichhornHayre(dat$z,mu,sigma,dat$Pi,"mean",cl)
out
ResamplingVariance(out,dat$Pi,"mean",1,str=dat$ST)

#Resampling with cluster
N=1500
data(SoberanisCruzData)
dat=with(SoberanisCruzData, data.frame(CL,z,Pi))
p=0.7
alpha=0.5
cl=0.90
out=SoberanisCruz(dat$z,p,alpha,dat$Pi,"total",cl)
out
ResamplingVariance(out,dat$Pi,"total",2,N,samplingVarEst::Pkl.Hajek.s(dat$Pi))

#Resampling with strata and cluster
N=1500
data(HorvitzDataStCl)
dat=with(HorvitzDataStCl, data.frame(ST,CL,z,Pi))
p=0.6
alpha=0.5
cl=0.95
out=Horvitz(dat$z,p,alpha,dat$Pi,"mean",cl,N)
out
ResamplingVariance(out,dat$Pi,"mean",3,N,samplingVarEst::Pkl.Hajek.s(dat$Pi))
}
\references{
Berger, Y.G., Skinner, C.J. (2005).
\emph{A jackknife variance estimator for unequal probability sampling.}
 Journal of the Royal Statistical Society B, 67, 79-89.

Campbell, C. (1980).
\emph{A different view of finite population estimation.}
 Proceedings of the Survey Research Methods Section of the American Statistical Association, 319-324.

Escobar, E.L., Berger, Y.G. (2013).
\emph{A new replicate variance estimator for unequal probability sampling without replacement.}
 Canadian Journal of Statistics 41, 3, 508-524.

López, E., Barrios, E. (2014).
\emph{samplingVarEst: Sampling Variance Estimation.}
R package version 0.9-9. Online http://cran.r-project.org/web/packages/survey/index.html

Quenouille, M.H. (1949).
\emph{Problems in Plane Sampling.}
The Annals of Mathematical Statistics 20, 355-375.

Wolter, K.M. (2007).
\emph{Introduction to Variance Estimation.}
 2nd Edition. Springer.
}
\seealso{
\code{\link{Warner}}

\code{\link{ChaudhuriChristofides}}

\code{\link{EichhornHayre}}

\code{\link{SoberanisCruz}}

\code{\link{Horvitz}}
}
\keyword{Campbell_Berger_Skinner}
\keyword{Escobar_Berger}
\keyword{Jackknife}
\keyword{Randomized_response}
\keyword{Resampling}
\keyword{Variance}

