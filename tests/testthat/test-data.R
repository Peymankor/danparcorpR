context("Test the datasets attributes")


test_that(desc = "Test corpus_2009 dataset",
          {
            start_time <- base::min(corpus_2009$Starttid)
            max_time <- base::max(corpus_2009$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2009-10-06 12:00:32", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2010-09-07 20:10:26", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2009$Sagstype) == 9 , TRUE)
            expect_equal(nlevels(corpus_2009$Parti) == 15 , TRUE)
            expect_equal(nlevels(corpus_2009$Rolle) == 5 , TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2009$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2009$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2010 dataset",
          {
            start_time <- base::min(corpus_2010$Starttid)
            max_time <- base::max(corpus_2010$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2010-10-05 12:00:13", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2011-09-30 13:59:56", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2010$Sagstype) == 10, TRUE)
            expect_equal(nlevels(corpus_2010$Parti) == 15 , TRUE)
            expect_equal(nlevels(corpus_2010$Rolle) == 6, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2010$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2010$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2011 dataset",
          {
            start_time <- base::min(corpus_2011$Starttid)
            max_time <- base::max(corpus_2011$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2011-10-04 12:00:09", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2012-09-13 14:57:42", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2011$Sagstype) == 9, TRUE)
            expect_equal(nlevels(corpus_2011$Parti) == 12 , TRUE)
            expect_equal(nlevels(corpus_2011$Rolle) == 5, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2011$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2011$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2012 dataset",
          {
            start_time <- base::min(corpus_2012$Starttid)
            max_time <- base::max(corpus_2012$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2012-10-02 11:59:41", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2013-09-10 17:03:11", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2012$Sagstype) == 10 , TRUE)
            expect_equal(nlevels(corpus_2012$Parti) == 12 , TRUE)
            expect_equal(nlevels(corpus_2012$Rolle) == 5, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2012$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2012$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2013 dataset",
          {
            start_time <- base::min(corpus_2013$Starttid)
            max_time <- base::max(corpus_2013$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2013-10-01 11:59:55", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2014-10-02 09:32:39", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2013$Sagstype) == 10 , TRUE)
            expect_equal(nlevels(corpus_2013$Parti) == 13 , TRUE)
            expect_equal(nlevels(corpus_2013$Rolle) == 5, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2013$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2013$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2014 dataset",
          {

            start_time <- base::min(corpus_2014$Starttid)
            #max_time <- base::max(corpus_2014$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2014-10-07 12:00:02", tz = "Europe/Copenhagen"), TRUE)
            #expect_equal(max_time >= base::as.POSIXct("2011-09-30 13:59:56", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2014$Sagstype) == 10 , TRUE)
            expect_equal(nlevels(corpus_2014$Parti) == 14 , TRUE)
            expect_equal(nlevels(corpus_2014$Rolle) == 5, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2014$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2014$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2015 dataset",
          {
            start_time <- base::min(corpus_2015$Starttid)
            #max_time <- base::max(corpus_2015$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2015-10-06 12:00:02", tz = "Europe/Copenhagen"), TRUE)
            #expect_equal(max_time >= base::as.POSIXct("2011-09-30 13:59:56", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2015$Sagstype) == 9 , TRUE)
            expect_equal(nlevels(corpus_2015$Parti) == 14 , TRUE)
            expect_equal(nlevels(corpus_2015$Rolle) == 5, TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2015$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2015$Sluttid), TRUE)
          })


test_that(desc = "Test corpus_2016 dataset",
          {
            start_time <- base::min(corpus_2016$Starttid)
            max_time <- base::max(corpus_2016$Sluttid)
            expect_equal(start_time >= base::as.POSIXct("2016-10-04 12:00:01", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(max_time >= base::as.POSIXct("2017-05-19 17:57:57", tz = "Europe/Copenhagen"), TRUE)
            expect_equal(nlevels(corpus_2016$Sagstype) == 10 , TRUE)
            expect_equal(nlevels(corpus_2016$Parti) == 14 , TRUE)
            expect_equal(nlevels(corpus_2016$Rolle) == 5 , TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2016$Starttid), TRUE)
            expect_equal(lubridate::is.POSIXct(corpus_2016$Sluttid), TRUE)
          })

