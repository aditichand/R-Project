rm(list=ls())
cat("\014")

library(dplyr)
library(tm)  # Text Mining Package
library(e1071)  # Functions for support vector machines, etc.
library(SnowballC)  # An R interface that implements Porter's word stemming algorithm for collapsing words to a common root 
library(caret)

cc <- read.csv(file='sp500_companies.csv', encoding = "UTF-8")
df.text <- cc[,15]
head(df.text)

mycorpus <- Corpus(VectorSource(cc$Longbusinesssummary))

# define customized stopwords
mystop <- c("company", "stock","inc","state")  
# define the text cleaning process
dtm.control = list(removePunctuation=T, removeNumbers=T,
                   stopwords=c(stopwords("english"), mystop),stripWhitespace=T, stemming=T)

# generate document-term matrix
dtm.full <- DocumentTermMatrix(mycorpus, control=dtm.control)  
inspect(dtm.full)

# remove terms occurring in less than 1% of the documents
dtm <- removeSparseTerms(dtm.full, 0.99)  
dim(dtm.full)  # 7966 words
dim(dtm)  # 1402 words



# initial inspection on term frequency and association
# find terms that occur at least 100 times
findFreqTerms(dtm, lowfreq = 100)


# sum of occurrences of a term across all documents
freq <- colSums( as.matrix(dtm) )
# sort frequency
freq.sorted <- sort( freq, decreasing = TRUE )
freq.sorted[1:10]  # the ten most frequently terms of the corpus


# now let us make a word cloud, make sure it is installed
#install.packages("wordcloud")
library(wordcloud)
install.packages("wordcloud2")

library(wordcloud2)

# look at build in color palettes
display.brewer.all()
# let us pick set1, 7 colors
wordcloud(names(freq), freq, min.freq=100, colors=brewer.pal(7, "Set2"))
# 50 words to be plotted 
wordcloud(names(freq), freq, max.words=50, colors=brewer.pal(7, "Set1"))

# set rot.per = 0.2 to have 20% words with 90 degree rotation
wordcloud(names(freq), freq, min.freq=5, max.words=50,colors=brewer.pal(7, "Set1"), 
          rot.per=0.2)


#3 wordcloud2

df <- data.frame(word = names(freq),freq=freq)
ordered_df <- df[order(-df$freq), ]
head(df)


wordcloud2(df, size=1.6, color='random-dark')

wordcloud2(data=ordered_df, size = 0.6, shape = 'circle',shuffle=FALSE,color='random-light')

wordcloud2(data=ordered_df, size = 0.5, shape = 'triangle-forward',shuffle=FALSE,color=brewer.pal(15, "Set2"))

wordcloud2(data=ordered_df, size = 0.5, shape = 'triangle-forward',shuffle=FALSE,color='random-light')


