# danparcorpR <a href='https://ramikrispin.github.io/USgrid/'><img src='man/figures/draftbadge.png' width="150" height="200" align="right"  /></a>

<!-- badges: start -->
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The danparcorpR package, abbreviation for (The Danish Parliament Corpus in R) is package provides the *clean* and *tidy* data of Hansards (transcripts of parliamentary speeches) each year of Parlimant (Folketinget) running from October to the following June. 

The whole package consisting of app. 41 million running words and 182.200 speeches. However, it must be mentioned that transcriptions are “corrected” by the Parliament transcription responsible so they are near to written language, e.g. they do not contain some typical speech features such as hesitations, self corrections and pauses, comprising filled pauses, and punctuation marks are added.


For each working year, (2009,2010,2011,2012,2013,2014,205,2016) the package provides *one* table containing the 9 columns:

Note: Each row is one *Speech* and columns provides the *feature* and specification of that row. The columns are:

* MeetingId     -       The ID of the parlimnat meeting

* Mødenummer    -       The number of the meeting

* Sagstype      -       The type of the speech

* Starttid      -       The start time of the speech (in y-m-d h:m:s format)    

* Sluttid       -       The end time of the speech (in y-m-d h:m:s format)

* Navn*         -       The name of the speacker

* Parti         -       The party name of speaker

* Rolle         -       The role (position) of the speaker

* Tekst         -       The transcribt of speech by the speaker

All datasets are in [tsibble](https://tsibble.tidyverts.org/index.html) format

**Source:** [The Danish Parliament Corpus 2009 - 2017, v1](https://repository.clarin.dk/repository/xmlui/handle/20.500.12115/8)

Installation
------------

Install the stable version from [CRAN](https://CRAN.R-project.org/package=USgrid):

``` r
install.packages("USgrid")
```

or install the development version from [Github](https://github.com/RamiKrispin/USgrid):

``` r
# install.packages("remotes")
remotes::install_github("RamiKrispin/USgrid")
```

## Examples

The hourly demand and generation (supply) of electricty in the US:

``` r
library(USgrid)
library(plotly)

data(US_elec)

plot_ly(data = US_elec,
        x = ~ date_time,
        y = ~ series,
        color = ~ type,
        colors = c("#66C2A5","#8DA0CB"),
        type = "scatter",
        mode = "lines") %>%
        layout(title = "US Electricity Demand vs. Supply (Hourly)",
               yaxis = list(title = "Mwh"),
               xaxis = list(title = "Source: US Energy Information Administration (Dec 2019)"))
```
<img src="man/figures/US_elec.png" width="100%" />

The hourly generation (supply) of electricty in the US by source:
``` r
plot_ly(data = US_source,
        x = ~ date_time,
        y = ~ series,
        color = ~ source,
        type = "scatter",
        mode = "lines") %>%
  layout(title = "US Electricity Generation by Energy Source",
         yaxis = list(title = "Mwh"),
         xaxis = list(title = "Source: US Energy Information Administration (Dec 2019)"))
```
<img src="man/figures/US_source.png" width="100%" />

The California subregion hourly demand by operator

``` r
plot_ly(data = Cal_elec,
        x = ~ date_time,
        y = ~ series,
        color = ~ operator,
        type = "scatter",
        mode = "lines") %>%
  layout(title = "California Hourly Demand by Operator",
         yaxis = list(title = "Mwh"),
         xaxis = list(title = "Source: US Energy Information Administration (Dec 2019)"))
```
<img src="man/figures/Cal_elec.png" width="100%" />
