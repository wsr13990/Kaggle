setwd("D:/Kaggle/SpookyAuthorIdentification")
train = read.csv("train.csv")
test = read.csv("test.csv")

#Baseline performance using BagToWord
trainText = train$text
trainLabel = train$author
