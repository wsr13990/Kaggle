install.packages("SnowballC")
install.packages("tm")

library(SnowballC)
library(tm)

setwd("D:/Kaggle/SpookyAuthorIdentification")
train = read.csv("train.csv")
test = read.csv("test.csv")

#Baseline performance using BagToWord

options(java.parameters = "-Xmx4000m")

convert_count <- function(x){
  x <- ifelse(x, "Yes", "No")
}

process_description <- function(data, freq){
  corpus <- VCorpus(VectorSource(train$text))
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, stripWhitespace)
  dtm <- DocumentTermMatrix(corpus)
  freq_words <- findFreqTerms(dtm, 1)
  dtm <- dtm[, freq_words]
  dtm <- apply(dtm, MARGIN=2, convert_count)
  dtm <- as.matrix(taxlist_dtm)
  return(dtm)
}


