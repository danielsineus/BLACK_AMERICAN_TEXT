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
tidy<-ble1%>%
  group_by(JobTitle)%>%
  unnest_tokens(word, JobText)%>%
  anti_join(stop_words)%>%
  count(word, sort = TRUE)
re<-head(tidy,10)
re
library(stringr)
ble$JobTitle1<-str_count(ble$JobTitle, "\\s+")+1
redsw<-head(ble,20)
ble$total <- sapply(ble$JobTitle, function(x) length(unlist(strsplit(as.character(x), "\\W+"))))
redsw<-head(ble,20)
attach(ble)
ble$JobTitle2<-ifelse(ble$total==1, word(string = ble$JobTitle, start = 1, end = 1, sep = fixed(" ")), 
                                    ifelse(ble$total==2, word(string = ble$JobTitle, start = 1,end = 2, sep = fixed(" ")),word(string = ble$JobTitle, start = 1,end = 3, sep = fixed(" "))))
ble$JobText<-removeWords(ble$JobText, stopwords(kind="en"))
redsw1<-head(ble,100)
corp<-VCorpus(VectorSource(ble$JobText))
head(corp,3)
library(tm)
library(qdap)
library(RColorBrewer)
library(ggplot2)
library(scales)
library(wordcloud)
class(ble)
getTransformations()
Toble<-content_transformer(function(x, pattern) gsub(pattern, " ", x))
ble$JobTitle2<-tm_map(ble$JobTitle2,Toble, "/")
ble$JobTitle2<-tm_map(ble$JobTitle2,Toble, "@")
ble$JobTitle2<-tm_map(ble$JobTitle2,Toble, "\\|")
ble$JobTitle2<-tm_map(ble$JobTitle2,content_transformer(tolower))
ble$JobTitle2<-tm_map(ble$JobTitle2,removeNumbers)
ble$JobTitle2<-tm_map(ble$JobTitle2,removePunctuation)
ble$JobTitle2<-tm_map(ble$JobTitle2,removeWords, stopwords("english"))


pared<-read.csv("US-based jobs.csv", header = T, stringsAsFactors = F)
paredcorpus<-VCorpus(VectorSource(pared$JobText))
str(paredcorpus)
is.list(paredcorpus)
paredcorpus[[1]]
inspect(paredcorpus[[1]])
getTransformations()

# to convert some pattern of text to a space
toSpace   <- content_transformer(function(text, pattern) str_replace_all(text, pattern, " "))
# to convert text to lower case
toLower   <- content_transformer(function(text) tolower(text))

paredcorpus <- tm_map(paredcorpus, toLower)
paredcorpus <- tm_map(paredcorpus, toSpace, '-|/')            # otherwise runs together
paredcorpus <- tm_map(paredcorpus, removePunctuation)         # might not be right (!)
paredcorpus <- tm_map(paredcorpus, stripWhitespace)
# WineCorpus <- tm_map(WineCorpus, removeWords, stopwords("english"))  # leave for now
# WineCorpus <- tm_map(WineCorpus, removeNumbers)            # not many around
# WineCorpus <- tm_map(WineCorpus, removeWords, c('yuck'))   # specific word(s)
inspect(paredcorpus[[2]])
dtm<-DocumentTermMatrix(paredcorpus)
freq<-colSums(as.matrix(dtm))
head(freq,6)
head(table(freq),20)
freq <- head(sort(freq, decreasing=TRUE), 30)
freq <- data.frame(names(paredcorpus), as.numeric(paredcorpus))
nb<-head(freq,10)
