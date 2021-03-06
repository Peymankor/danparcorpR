% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{corpus_2009}
\alias{corpus_2009}
\title{The Danish Parliament Corpus- working year of 2009/2010}
\format{
A data frame with columns:
\describe{
 \item{MeetingId}{Item number for each lego set}
 \item{Mødenummer}{Name of set}
 \item{Sagstype}{Year set was manufactured}
 \item{Starttid}{Theme of set}
 \item{Sluttid}{Theme of set}
 \item{Navn}{Theme of set}
 \item{Parti}{Subtheme of set. Sets with no subtheme have an empty string
   \code{""} for subtheme.}
 \item{Rolle}{Number of minifigures in set. The vast majority of sets
   with \code{NA} minifigures contain zero minifigures, however there
   are a few exceptions.}
 \item{Tekst}{URL to an image of the set}
}
}
\source{
\url{https://repository.clarin.dk/repository/xmlui/handle/20.500.12115/8}, downloaded 2020-07-06
}
\usage{
corpus_2009
}
\description{
The Danish Parliament Corpus contains Hansards
(transcripts of parliamentary speeches) from the sittings in the Chamber of the
 Danish Parliament, Folketinget. This corpus provide the the data of transcript for
 year 2009-2010.

Time zone: Europe/Copenhagen
}
\examples{
data(corpus_2009)
}
\keyword{datasets}
