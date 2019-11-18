library(tidyverse)
library(tidytext)
library(dplyr)
library(knitr)
library(tm)
library(stringr)
ble<-read.csv("US-based jobs.csv", header = T, stringsAsFactors = F)
str(ble)
ble1<-ble[,c(2:6)]
str(ble1)
# to find the amount of jobs offered by the diverent companies
source<-ble%>%
  group_by(company_name)%>%
  count()%>%
  arrange(-n)
grap<-head(source, 5)
grap
library(ggplot2)
library(RColorBrewer)
# an histogram to display the top 10 companies
grap%>%
  ggplot(aes(company_name, n, fill=company_name))+
  geom_bar(stat = "identity")+
  theme(legend.position = "none")
  
#clean the text
ble1$JobText<-str_to_lower(ble1$JobText)
ble1$JobText<-str_trim(ble1$JobText, side = "both")

# remove numbers and punctuation
ble1$Jobtext<- gsub('[[:digit:]]+', '', ble1$JobText)
ble1$JobText<- gsub('[[:punct:]]+', '', ble1$JobText)
ble1$JobText<- gsub("http[[:alnum:]]*", "", ble1$JobText)
ble1$JobText<- gsub("([[:alpha:]])\1+", "", ble1$JobText)
replace_reg <- "https?://[^\\s]+|&amp;|&lt;|&gt;|\bRT\\b"
word<-ble%>%
  mutate(text=str_replace_all(ble$JobText, replace_reg,""))%>%
  unnest_tokens(word, text, token = "words")

word1<-word%>%
  anti_join(stop_words)%>%
  count(word, sort = TRUE)
head(word1, 20)
#Barplot to determine the most words used
corpus<-word%>%
  anti_join(stop_words)%>%
  count(word, sort = TRUE)%>%
  ungroup()%>%
  top_n(30)%>%
  ggplot(aes(x=fct_reorder(word, n),y=n))+
  geom_bar(stat="identity", width = 0.5)+
  xlab(NULL)+
  coord_flip()+
  ylab("Word Frequency")+
  ggtitle("Most Common Corpus Words")+
  theme(legend.position = "none")
corpus
# Abilities and skills looked for in Amazon Company
library(wordcloud)
library(RColorBrewer)
library(reshape2)
word2<-word%>%
  anti_join(stop_words)%>%
  filter(company_name=="Amazon.com")%>%
  count(word, sort = TRUE)%>%
  with(wordcloud(word, n, max.words = 200, rot.per = 0.35, colors = brewer.pal(8, "Dark2")))
  
word3<-word%>%
  anti_join(stop_words)%>%
  filter(company_name=="MATSON NAVIGATION COMPANY, INC")%>%
  count(word, sort = TRUE)
wordcloud(word, n, max.words = 200, rot.per=0.35, color)
library(wordcloud)
library(RColorBrewer)
library(reshape2)
wordcloud(word2, min.freq = 3, scale =c(5,-2), random.order = FALSE, random.color = FALSE, colors = "Dark2")

word4<-word%>%
  anti_join(stop_words)%>%
  filter(company_name=="Petco")%>%
  count(word, sort = TRUE)

word5<-word%>%
  anti_join(stop_words)%>%
  filter(company_name=="North Shore Medical Center")%>%
  count(word, sort = TRUE)

head(word2)
head(word3)
word2<-word%>%
  anti_join(stop_words)%>%
  filter(company_name=="Amazon.com")%>%
  count(word, sort = TRUE)



bigrams<-ble%>%
  mutate(text=str_replace_all(ble$JobText, replace_reg, ""))%>%
  unnest_tokens(bigram, text, token = "ngrams", n=2)
head(bigrams, 6)

bigrams<-bigrams%>%
  separate(bigram, into = c("first", "second"), sep=" ", remove = FALSE)%>%
  anti_join(stop_words, by=c("first"="word"))%>%
  anti_join(stop_words, by=c("second"="word"))%>%
  filter(str_detect(first, "[a-z]")&
           str_detect(second, "[a-z]"))
red<-bigrams%>%
  group_by(company_name)%>%
  count(bigram, sort = TRUE)
red%>%
  top_n(15)%>%
  ggplot(aes(x=bigram,n),y=n)+
  geom_bar(stat = "identity", width = 0.5)

hred<-head(bigrams,10)
hred
bigrams2<-ble%>%
  mutate(text=str_replace_all(ble$JobText, replace_reg,""))%>%
  unnest_tokens(bigra, text, token = "ngrams", n=3)
bigrams2<-bigrams2%>%
  separate(bigra, into = c("first", "second", "third"), sep = " ", remove = FALSE)%>%
  anti_join(stop_words, by=c("first"="word"))%>%
  anti_join(stop_words, by=c("second"="word"))%>%
  anti_join(stop_words, by=c("third"="word"))%>%
  filter(str_detect(first, "[a-z]")&
           str_detect(second, "[a-z]")&
           str_detect(third, "[a-z]"))

reds<-bigrams2%>%
  group_by(company_name)%>%
  count(bigra, sort = TRUE)
class(word1)
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
