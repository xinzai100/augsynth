% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multisynth_class.R
\name{multisynth}
\alias{multisynth}
\title{Fit staggered synth}
\usage{
multisynth(
  form,
  unit,
  time,
  data,
  n_leads = NULL,
  n_lags = NULL,
  nu = NULL,
  lambda = 0,
  fixedeff = FALSE,
  n_factors = 0,
  scm = T,
  time_cohort = F,
  eps_abs = 1e-04,
  eps_rel = 1e-04,
  verbose = FALSE,
  ...
)
}
\arguments{
\item{form}{outcome ~ treatment}

\item{unit}{Name of unit column}

\item{time}{Name of time column}

\item{data}{Panel data as dataframe}

\item{n_leads}{How long past treatment effects should be estimated for, default is number of post treatment periods for last treated unit}

\item{n_lags}{Number of pre-treatment periods to balance, default is to balance all periods}

\item{nu}{Fraction of balance for individual balance}

\item{lambda}{Regularization hyperparameter, default = 0}

\item{fixedeff}{Whether to include a unit fixed effect, default F}

\item{n_factors}{Number of factors for interactive fixed effects, setting to NULL fits with CV, default is 0}

\item{scm}{Whether to fit scm weights}

\item{time_cohort}{Whether to average synthetic controls into time cohorts}

\item{eps_abs}{Absolute error tolerance for osqp}

\item{eps_rel}{Relative error tolerance for osqp}

\item{verbose}{Whether to print logs for osqp}

\item{...}{Extra arguments}
}
\value{
multisynth object that contains:
        \itemize{
         \item{"weights"}{weights matrix where each column is a set of weights for a treated unit}
         \item{"data"}{Panel data as matrices}
         \item{"imbalance"}{Matrix of treatment minus synthetic control for pre-treatment time periods, each column corresponds to a treated unit}
         \item{"global_l2"}{L2 imbalance for the pooled synthetic control}
         \item{"scaled_global_l2"}{L2 imbalance for the pooled synthetic control, scaled by the imbalance for unitform weights}
         \item{"ind_l2"}{Average L2 imbalance for the individual synthetic controls}
         \item{"scaled_ind_l2"}{Average L2 imbalance for the individual synthetic controls, scaled by the imbalance for unitform weights}
        \item{"n_leads", "n_lags"}{Number of post treatment outcomes (leads) and pre-treatment outcomes (lags) to include in the analysis}
         \item{"nu"}{Fraction of balance for individual balance}
         \item{"lambda"}{Regularization hyperparameter}
         \item{"scm"}{Whether to fit scm weights}
         \item{"grps"}{Time periods for treated units}
         \item{"y0hat"}{Pilot estimates of control outcomes}
         \item{"residuals"}{Difference between the observed outcomes and the pilot estimates}
         \item{"n_factors"}{Number of factors for interactive fixed effects}
        }
}
\description{
Fit staggered synth
}
