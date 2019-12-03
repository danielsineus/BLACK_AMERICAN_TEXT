# Quantitative Analysis of African American Texts
----
The objective of this document remains academic and personal. It is academic in the sense that it can provide materials for people to discuss the contents and to reproduce the codes while learning from the process. It is also deemed as a tutorial due to fact the guidelines used to conduct the litteray study of the texts of some African-American authors might be helpful for those who would like to analyse authors found in the gutenberg project.
The  personal part of this piece of work is to be able to give proof of my ability to use R programming for text mining. On one hand, The study aims to quantify the books or any texts published by 4 African-American authors known and revered for their fight to free socioeconomically the black in the US. On the other hand, this piece of work will present analyses that will be based on sentiments approaches and also figure out similar themes developped by these authors. The authors are as following: Booker T. Washington (1890 -1915), W.E.B Du Bois (1868 - 1963), Frederick Douglass (1818 - 1985), and Zora Nearle Hurston (1891 - 1960). 
The authors's texts or books could be imported from the gutenberg project :  https://www.gutenberg.org/. During the work, I haven't neither read the books which are being analyzed nor showed any presomption that I have a good deal of knowledge of contents of these books. I have only read a book by Booker T. Washington and one by W.E.B Du Bois. In a nutchell, I've assumed that they were all troubled and preoccupied by the same issues around their time. Therefore, the words of their books will show similarities.

## Gathering and Tidying Data
As mentionned above, the books or texts are stored in a project called gutenberg project : https://www.gutenberg.org/. the import of data has been possible with the gutenberg package. The function gutenberg.download() has been pretty much useful to excute the job. The best way to know the exact texts to download. One needs to know the ID of each book. The ID can be found in the project or a function can be used to find the ID of the text provinding the titles of the texts or books are known. Other packages have been utilized, such as:
* tidyverse
* stingr
* tidytext
* ggplot2

The first thing to tidy the data collected is by tokenizing the texts into a bag of words, that is to say attribute a row to each word. I noticed that some words are unnecessary and they have to be removed subsequently. These are not nouns or adjectives. These grammatical entities that have been removed refer to entities such as articles, prepositions, conjunctions, and so on.  In case there is a need to know more about the stopwords that have been excluded from the text analysis, please refer to this link: https://www.ranks.nl/stopwords or http://xpo6.com/list-of-english-stop-words/. The tokenization has been done with grouping the texts according to the titles of the books by authors.thus, it could easier to display the words in respect to their titles.  

## Comments on the Results
--- 
The text studies are essentially based on some statistic approaches, frequency approach and the sentiment approach. We are interested in determing the words that have the high frequencies, these words could repeat in all these tects of the author. 
## Graphs
![graph 1](https://github.com/danielsineus/BLACK_AMERICAN_TEXT/blob/master/plot_dubois.png)
