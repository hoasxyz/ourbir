% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bir_to.R
\name{bir_to}
\alias{bir_to}
\title{Happy birthday!}
\usage{
bir_to(path = ourbir::bir_file("example.xlsx"), pre1d = TRUE,
  pre5d = TRUE)
}
\arguments{
\item{path}{A string represent the path of your birthday table.}

\item{pre1d}{Remind you one day in advance.}

\item{pre5d}{Remind you five days in advance. This param mainly help you buy one surprising gift.}
}
\description{
This function is used to remind you about the birthday of your relatives, friends,
or other things.
}
\examples{

bir_to(path = ourbir::bir_file("example.xlsx"), pre1d = TRUE, pre5d = FALSE)
}
