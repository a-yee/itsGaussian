# Load datafile
Metadata <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)

# drops column 3 of id values
Metadata$V3 = NULL
View(Metadata)

MetadataOrig <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)
View(MetadataOrig)

# Row 698 is not of the same form as the rest of the rows
MetadataOrig <- MetadataOrig[-698,]
View(MetadataOrig)

# filtering out irrelevant vals 
MetadataOrig$V3 = NULL
MetadataOrig$row.names = NULL

# Notes: 
# Row 698: should we keep in or leave out. The row names don't update after delete so may be fine.
# Want to cross reference with the sparse words data set

# Creating Sparse word matrix
dictionary<- read.delim("~/Documents/math191/project/itsGaussian/Enron/vocabulary.txt", header=FALSE)
View(dictionary)

# Loading in two word files to see dimensions
spsword0 <- read.delim("~/Documents/math191/project/itsGaussian/Enron/tabWords/testSparse_Word_0.txt", header=FALSE)
View(spsword0)

dates <- Metadata$V1
View(dates)
dates1 <- dates$year

# Finding index of sports related words in dictionary

# Word number 407
commish <- which(dictionary == "commissioner")   

# Word number 17969
football <- which(dictionary == "football")

# Word number 15431
fantasy <- which(dictionary == "fantasy")

# Sample code extracting only rows of a particular sender
K = which(Metadata$V4 == "gary.lamphier@enron.com")
KK = Metadata[K,]
View(K)

library(R.matlab)
# emails <- readMat("~/Documents/math191/project/itsGaussian/Enron/enron_emails.mat", sparseMatrixClass = "SparseM")
# View(emails)


# creating array of indices denoting gary lamphier's sent emails
write.csv(K, file = "test_sent.csv")

test = dictionary$V1
write.csv(test, file = "vocabulary.csv", quote = FALSE)

# Loaded in enron_emails.mat as a csv file
email_index <- read.csv("~/Documents/math191/project/itsGaussian/Enron/emails.csv", header=FALSE)
View(email_index)

# filters out only rows that pertain to gary lamphier's sent emails
lam_emails <- email_index[which(email_index$V1 == K),]
View(lam_emails)

lam_unique <- read.csv("~/Documents/math191/project/itsGaussian/lam_uniqueWords.csv", header=FALSE)
lam_unique1 <- lapply(lam_unique,as.numeric)
uni_words <- dictionary[lam_unique1,]
View(lam_unique1)

word_freq1 <- read.csv("~/Documents/math191/project/itsGaussian/word_freq1.csv", header=FALSE)
View(word_freq1)
Words = word_freq1$V1
new_words = lapply(Words, function(x) dictionary[x,])
View(new_words)

Metadata$V1 = NULL
Metadata$V2 = NULL
View(Metadata)
num_recip  <- Metadata$V5
Metadata$V5 = NULL
index = seq(6,175,2)
index = as.character(index)
index
lapply(index, function(x) paste("V",x, sep=""))
new_index <- lapply(index, function(x) -1*x)
new_meta<- lapply(new_index, function(x) ( Metadata[x]) )
View(new_meta)
sent_uni <- unique(Metadata$V4)
View(sent_uni)

Metadat2 <- MetadataOrig$V5
View(Metadat2)
Metadat2 <- unique(Metadat2)
View(Metadat2)
library(R.matlab)

readMat('senders.mat')

funct <- function(fb_index){  
  new_df <- rbind(new_df, Metadata[fb_index,])
  return(new_df)
}

new_df <- lapply(fb_index, funct)
new_df <- Metadata[9,]
KK = rbind(KK,Metadata[26,])
View(KK)
View(new_df)

new_df$V1.V4
uni_senders <- unique(new_df$V1.V4)
View(uni_senders)

# Finds the unique entries of the entire dataframe 
test = unique(unlist(Metadata))

# Given a specific email usr give back the array of row indices corr to their inbox
write.csv(test, file = "recip.csv", quote = FALSE)


# Function that removes the nth row, want to modify for column
Nth.delete<-function(dataframe, n)dataframe[-(seq(n,to=nrow(dataframe),by=n)),]
# DF<-data.frame(A=1:15, B=rnorm(15), C=sample(LETTERS,15))
# Nth.delete(DF, 3)

# column version, starts deleting at col m and will delete every nth column after
Mth.delete <- function(dataframe,m,n)
  dataframe[,-(seq(m,to=ncol(dataframe),by=n))]

# Doing this on Metadata after taking out columns 1-5 will give you the data frame entries of just recips
DF = Mth.delete(Metadata,1,2)
test2 = which(DF == "tana.jones@enron.com", arr.ind=TRUE)
View(test2)



# above which function doesn't capture results in columns other than the first column: soln
test3 = apply(DF, 2, function(x) which(x == "tana.jones@enron.com", arr.ind=TRUE) )
View(test3)
write.csv(test3, "test3.csv", quote = FALSE)

s = "tana.jones@enron.com"
# *** Solves problem correctly for a specific s. outputs int list of indices you want
t <- sapply(s,function(s) which(apply(DF==s,1,any)));

# to stack vector results use c()
test2 <- test2[,'row']
View(test2)

# creates empty vec
vec <- vector("integer")
# creates stacked vector in for you want. repeat with differnt second input
vec <- c(vec,test2)
# e.g.
vec <- c(vec,t)

# extension of code above but looping and outputing to file
indexExtract <- function(s){
  temp <- sapply(s,function(s) which(apply(DF==s,1,any)));
  write.csv("")
}

# change to row version 
rbind.fill <- function(...){
  nm <- list(...) 
  nm <- lapply(nm, as.matrix)
  n <- max(sapply(nm, ncol)) 
  do.call(cbind, lapply(nm, function (x) 
    rbind(x, matrix(, n-nrow(x), ncol(x))))) 
}

test4 <- as.data.frame(test2)
library(plyr)
df <- data.frame(Row=as.numeric())
df <- rbind(df,test2)
df <- t(df)
k <- c(1:10)
k = as.data.frame(k, Row=as.numeric())
df <- rbind(df,k)
?as.data.frame
