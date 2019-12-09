# Quantitative Analysis of three African American Authors
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
The text studies are essentially based on some statistic approaches, frequency approach and the sentiment approach. We are interested in determing the words that have the high frequencies, these words could repeat in all these tects of the author. Firstly, we take a glimpse of the number of words used by each author for each book or text. Considering the books alone, some authors used more words than others to write their stories or about the issues. Zora Nearl Hurston used less amount of words among the four authors targeted in this study. In the same vein, Frederick Douglass comes second. In general, quantifying the amounts of words used by author to convey their messages or debate issues that preoccupied them comes down to the synthesis that W.E.B Dubois and Booker T. Washington are more verbose than two others regardless the writing styles and genres. The frequency approach lets appear the fact that Booker T. Washington is the least prolific writers among the group of authors considered. if we only base on the texts or books existed. An illustration might help picture the differences. 
# Du Bois
| Du Bois's Books|Number of words|
|---|---|
|`The Souls of Black Folk`|6769|
|`The Quest of the Silver Fleece: A Novel`|14492|
|`His Economic Progress in Relation to his Moral and Religious Development`|3568|
|`Darkwater: Voices from within the Veil`|7420|

|Hurston's books|number of words|
|--|--|
|De Turkey and De Law: A Comedy in three Acts|3666|
|Poker!|199|
|The Mule_bone: A Comedy of Negro Life in three Acts|2142|
|Three Plays: Lawing;Forty Yards;Woofing|1025|

Booker T. Washington, for most the . Secondly, we determine the proportion of the same words used by the three authors. It helps use understand words that are likely to be used and in what proportion. Let's take an example of a few words amongst a long list of words. 

|words|Washington|Du Bois|Douglass|
|--|--|--|--|
|abolition|0.01424|0.00614|0.0243|
|die|0.01424|0.00614|0.0162|
|hanged|0.01424|0.00614|0.0162|
|slavery|0.0284|0.00614|0.0324|

## Results and Graphs

![graph 1](https://github.com/danielsineus/BLACK_AMERICAN_TEXT/blob/master/plot_dubois.png)

The sentiment analysis is mostly characterized by a binary distinction, such as positivity versus negativity or joy versus sadness. For Du Bois's case, we base our approach on NRC Emotion Lexicon ![link](https://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm). The sentiment analysis can subjectively make clear the feelings by which the authors were overwhelmed when they were writing any texts. By the same token, the same feelings can get through the authors's readers. When considering the figure above, the texts or books written by Du Bois except one of them bring more feelings toward negativity. More words tend toward negativity are used.  

![graph 2](https://github.com/danielsineus/BLACK_AMERICAN_TEXT/blob/master/plot_book.png)

For the Booker T Washington's case, we base our approach on the nrc lexicons. ![link](https://rstudio-pubs-static.s3.amazonaws.com/236096_2ef4566f995e48c1964013310bf197f1.html). The binary distinction opposes joy to sadness. When analyzing the graphs, The book entitled "The Story of Slavery" bring more saddness than joy to the readers, however the book titled "The Future of the American Negro" makes the readers feel a sort of joy. Readers can experience bith joy and sadness. But, it is not clear saying that one feeling will prevail. The writer might be the one experince the feelings and transfer these feelings through his writings by picking unconsciously words that might expressing feelings related to joy or sadness.

![graph 3](https://github.com/danielsineus/BLACK_AMERICAN_TEXT/blob/master/plot_fred.png)

The Frederick Douglass wrote the article that appears first in the set of graphs with exilerating terms. On the contrary, the second and third articles reveal words related to sadness. The book entitled "My Bondage and my Freedom" is embeded with more words expressing sadness. 

![graph 4](https://github.com/danielsineus/BLACK_AMERICAN_TEXT/blob/master/plot_neal.png)

## Discussion and Alternatives

We will orient the discussion toward weaknesses. Firstly, we notice a lack of semantic insights that this text mining analysis didn't enable me to cover. Here, we only elucidate some semantic analysis based on a sentiment approach where the whole data are tokenized by bags of words, which refers to the isolation of each word per row. This sentiment analysis is envisioned to characterize the feelings that might arouse the authors' texts. These feelings can be the authors'ones. They might be thereafter transfered to the readers When reading the authors' texts. Therefore, other feelings that could be depicted through context are not taken into account. In fact, contexts inside the texts can't be grasped by this sentiment analysis because so many contextual components have been consigned into oblivion by this approach. But, it is important to remind that the sentiment analysis enables us to perceive only the writer's feelings at the time that the texts were written, which is important but not sufficient to develop more insights. 

We acknoledge that other feelings can be considered by the bing lexicons, But we only rely on the dichotomy joy and unhappiness.
The discussion can always be taken to another level outside the context of this text mining. It is not possible yet, as far as we know, for any laymen like me  or students  to conduct certain text mining analyses on creole texts or books. Some packages don't really incorporate the creole lexicons. For example, we have udpipe package, which we didn't use. It helps us identify the grammatical components. Another example is that of The universal dependencies that don't have creole among the list of languages last time we checked. The opinion and sentiment lexicons (bing, Afinn, NRC) have not been yet considered for the Haitian creole. Therefore, we can't really attribute any sentiment to the words in creole. This work is left to the community of linguistics and programmers to work on this project in order to make sure that creole can be used at this level of analysis.
