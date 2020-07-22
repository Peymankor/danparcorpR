## code to prepare `processing` dataset goes here

#usethis::use_data(processing, overwrite = TRUE)


# Source
# https://repository.clarin.dk/repository/xmlui/handle/20.500.12115/8

library(XML)
library(xml2)
library(tidyverse)
library(lubridate)


#####################################################################
table_from_xml_doc <- function(xml_doc) {

   xml_parse <- xmlParse(xml_doc)

#   ################################ Tale Nodes ########################

   Starttid <- xpathApply(xml_parse, "//Tale",
                          function(x){
                            if("Starttid" %in% names(x))
                              xmlValue(x[["Starttid"]])
                            else NA})

   Starttid_col <- Starttid %>% unlist() %>%
     as_tibble_col(column_name = "Starttid") %>%
     mutate(Starttid= ymd_hms(Starttid, tz="Europe/Copenhagen"))

##

  Sluttid <- xpathApply(xml_parse, "//Tale",
                        function(x){
                          if("Sluttid" %in% names(x))
                            xmlValue(x[["Sluttid"]])
                          else NA})

  Sluttid_col <- Sluttid %>% unlist() %>%
    as_tibble_col(column_name = "Sluttid") %>%
    mutate(Sluttid= ymd_hms(Sluttid, tz="Europe/Copenhagen"))

##

  Navn <- xpathApply(xml_parse, "//Tale",
                     function(x){
                       if("Navn" %in% names(x))
                         xmlValue(x[["Navn"]])
                       else NA})

  Navn_col <- Navn %>% unlist() %>%
    as_tibble_col(column_name = "Navn")

##

  Rolle <- xpathApply(xml_parse, "//Tale",
                      function(x){
                        if("Rolle" %in% names(x))
                          xmlValue(x[["Rolle"]])
                        else NA})

  Rolle_col <- Rolle %>% unlist() %>%
    as_tibble_col(column_name = "Rolle")

##

  Tekst <- xpathApply(xml_parse, "//Tale",
                      function(x){
                        if("Tekst" %in% names(x))
                          xmlValue(x[["Tekst"]])
                        else NA})

  Tekst_col <- Tekst %>% unlist() %>%
    as_tibble_col(column_name = "Tekst")

##

  Parti <- xpathApply(xml_parse, "//Tale",
                      function(x){
                        if("Parti" %in% names(x))
                          xmlValue(x[["Parti"]])
                        else NA})

  Parti_col <- Parti %>% unlist() %>%
    as_tibble_col(column_name = "Parti")


#   #############################################################
#   ##########################Parent Node of Tale###############


# Sagstype

  Sagstype <- xpathApply(xml_parse, "//Tale",
                         function(x){
                           par_node <- xmlParent(x)

                           if("Sagstype" %in% names(par_node))

                             xmlValue(par_node[["Sagstype"]])

                           else NA

                         })

  Sagstype_col <- Sagstype %>% unlist() %>%
    as_tibble_col(column_name = "Sagstype")


#   ###################################################################
#   ##################################################################
#   #####################################################################

  MeetingId <- xpathApply(xml_parse, "//Tale",
                          function(x){
                            grand_par <- xmlParent(xmlParent(x))

                            if("MeetingId" %in% names(grand_par))

                              xmlValue(grand_par[["MeetingId"]])

                            else NA
                          })

  MeetingId_col <- MeetingId %>% unlist() %>%
    as_tibble_col(column_name = "MeetingId")


  ###

  Mødenummer <- xpathApply(xml_parse, "//Tale",
                           function(x){
                             grand_par <- xmlParent(xmlParent(x))

                             if("Mødenummer" %in% names(grand_par))

                               xmlValue(grand_par[["Mødenummer"]])

                             else NA
                           })
  Mødenummer_col <- Mødenummer %>% unlist() %>%
    as_tibble_col(column_name = "Mødenummer")

#   # DataFrame
#

  edix_combined <- tibble(MeetingId_col,Mødenummer_col,Sagstype_col,Starttid_col,Sluttid_col,Navn_col,
                          Parti_col, Rolle_col, Tekst_col)

  ### Encoding

  Encoding(edix_combined[["Mødenummer"]]) <- "UTF-8"
  Encoding(edix_combined[["Sagstype"]]) <- "UTF-8"
  Encoding(edix_combined[["Navn"]]) <- "UTF-8"
  Encoding(edix_combined[["Parti"]]) <- "UTF-8"
  Encoding(edix_combined[["Rolle"]]) <- "UTF-8"
  Encoding(edix_combined[["Tekst"]]) <- "UTF-8"


  edix_combined <-edix_combined %>% mutate (Sagstype = as.factor(Sagstype),
                                            Parti = as.factor(Parti),
                                            Rolle = as.factor(Rolle))

  return(edix_combined)
}



#################################################################
#################################################################


##

corpus_2009 <- table_from_xml_doc("data-raw/EdixiXMLExport_20091.xml") %>%
  arrange(Starttid)

##


table_20101 <- table_from_xml_doc("data-raw/EdixiXMLExport_20101.xml")
table_20102 <- table_from_xml_doc("data-raw/EdixiXMLExport_20102.xml")

corpus_2010 <- table_20101 %>%
  rbind(table_20102) %>% arrange(Starttid)

##

corpus_2011 <- table_from_xml_doc("data-raw/EdixiXMLExport_20111.xml") %>%
  arrange(Starttid)

##

corpus_2012 <- table_from_xml_doc("data-raw/EdixiXMLExport_20121.xml") %>%
  arrange(Starttid)

##

corpus_2013 <- table_from_xml_doc("data-raw/EdixiXMLExport_20131.xml") %>%
  arrange(Starttid)

##

table_20141 <- table_from_xml_doc("data-raw/EdixiXMLExport_20141.xml")
table_20142 <- table_from_xml_doc("data-raw/EdixiXMLExport_20142.xml")

corpus_2014 <- table_20141 %>% rbind(table_20142) %>%
  arrange(Starttid)

##

corpus_2015 <- table_from_xml_doc("data-raw/EdixiXMLExport_20151.xml") %>%
  arrange(Starttid)

##

corpus_2016 <- table_from_xml_doc("data-raw/EdixiXMLExport_20161.xml") %>%
  arrange(Starttid)

##

usethis::use_data(corpus_2009,corpus_2010,corpus_2011,corpus_2012,
                  corpus_2013, corpus_2014,
                  corpus_2015, corpus_2016)


# Example #1 in ReadME

devtools::install_github("tidyverse/tidyverse")
library(tidyverse)

spech_by_parti <- corpus_2009 %>%
  group_by(Parti)  %>%
  summarise(sum_speech = n()) %>%
  filter(Parti != NA | Parti != "")


ggplot(spech_by_parti, aes(reorder(Parti, sum_speech), sum_speech)) +
  geom_bar(stat="identity", color="white", fill="blue") +
  xlab("Party Name") +
  ylab("Numbers of Speech") +
  ggtitle("Party Vs. Number of Speech - 2009/2010 Parliament Year") +
  coord_flip()


## Example #2

library(wordcloud)
library(tidytext)
stop_word_danish <- read_delim("https://gist.githubusercontent.com/berteltorp/0cf8a0c7afea7f25ed754f24cfc2467b/raw/305d8e3930cc419e909d49d4b489c9773f75b2d6/stopord.txt", delim = " ", col_names = "word")

stop_word_danish_format <- tibble(stop_word_danish, lexicon="SMART")

corpus_2010_DF <- corpus_2010 %>% filter(Parti == "DF")

corpus_2010_DF_tidy <- corpus_2010_DF %>% as_tibble() %>%
  unnest_tokens(word, Tekst)

par(bg="black")
corpus_2010_DF_tidy %>%
  anti_join(stop_word_danish_format) %>%
  count(word) %>%
  with(wordcloud(word, n, scale = c(4,0.5) ,
                 max.words = 50, random.order=FALSE, rot.per=0.35,
                 colors=brewer.pal(8, "Dark2")))


#pkgdown::deploy_to_branch()
