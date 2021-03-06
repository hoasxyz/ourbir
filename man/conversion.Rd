% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert.R
\name{lunarToSolar}
\alias{lunarToSolar}
\alias{solarToLunar}
\title{Convert between lunar calendar and solar calendar}
\usage{
lunarToSolar(x, more = FALSE)

solarToLunar(x, more = FALSE)
}
\arguments{
\item{x}{Date format of string or \code{Date} class data created by \code{lubridate}.}

\item{more}{Show more information of the relative Date.}
}
\description{
\code{lunarToSolar} is used to convert the date of lunar calendar to solar calendar;
\code{solarToLunar} is used to convert the date of solar calendar to lunar calendar.
}
\section{Attention}{

 In \code{lunarToSolar} function, Feburary 29th and 30th in lunar calendar are missing
  in \code{lubridate::ymd()}!
}

\examples{
t <- c("19 2 28", "19 7 3")
lunarToSolar(today())
lunarToSolar("19 2 29")
lunarToSolar(t)

solarToLunar(today())
solarToLunar(t)
}
