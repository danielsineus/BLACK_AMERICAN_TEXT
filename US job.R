library(tidyverse)
library(tidytext)
library(dplyr)
library(knitr)
library(tm)
library(textclean)
library(stringr)
ble<-read.csv("US-based jobs.csv", header = T, stringsAsFactors = F)
str(ble)
ble1<-ble[,c(2:6)]
str(ble1)
ble1$JobText<-str_to_lower(ble1$JobText)
ble1$JobText<-str_trim(ble1$JobText, side = "both")

# remove numbers and punctuation
ble1$Jobtext<- gsub('[[:digit:]]+', '', ble1$JobText)
ble1$JobText<- gsub('[[:punct:]]+', '', ble1$JobText)
ble1$JobText<- gsub("http[[:alnum:]]*", "", ble1$JobText)
ble1$JobText<- gsub("([[:alpha:]])\1+", "", ble1$JobText)
#check the number of Na per column
sum(is.na(ble1$JobTitle))
na_count <-sapply(ble1, function(y) sum(length(which(is.na(y)))))
na_count<-data.frame(na_count)
head(na_count)
help("str_trim")
tidy<-ble1%>%
  group_by(JobTitle)%>%
  unnest_tokens(word, JobText)%>%
  anti_join(stop_words)%>%
  count(word, sort = TRUE)
re<-head(tidy,100)
mydata<-tolower(tidy)
library(textclean)
my<-strip(mydata)


