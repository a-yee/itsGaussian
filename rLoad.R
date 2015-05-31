# Load datafile
Metadata <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)
# to load place the location and datafile name in the quotations above

# Data cleaning to minimize to just recipients of emails
Metadata$V1 = NULL
Metadata$V2 = NULL
Metadata$V3 = NULL
Metadata$V4 = NULL
Metadata$V5 = NULL

# Leave column V4 if you want to look at senders; useful code for that
# uncomment below for Sample code extracting only rows of a particular sender
# K = which(Metadata$V4 == "gary.lamphier@enron.com")
# KK = Metadata[K,]

# Finds the unique entries of the entire dataframe 
uni_recip = unique(unlist(Metadata))

# Function that removes the nth row, want to modify for column
Nth.delete<-function(dataframe, n)dataframe[-(seq(n,to=nrow(dataframe),by=n)),]
# uncomment below to try example of how this function works
# DF<-data.frame(A=1:15, B=rnorm(15), C=sample(LETTERS,15))
# Nth.delete(DF, 3)

# column version, starts deleting at col m and will delete every nth column after
Mth.delete <- function(dataframe,m,n){
  dataframe[,-(seq(m,to=ncol(dataframe),by=n))]}

# # Doing this on Metadata after taking out columns 1-5 will give you the data frame entries of just recips. Filters out the {TO,BCC,CC} in every other column
# Maky still have TO,BCC,CC from bad inputs into Metadata
DF = Mth.delete(Metadata,1,2)

# uncomment below to see example of code that will give back row and column indices of a specific user
# of all instances of a specific email recipient in set of stripped down set of all recipients
# test2 = which(DF == "tana.jones@enron.com", arr.ind=TRUE)
# View(test2)

# %%%%%%%%%%%% IMPORTANT CODE %%%%%%%%%%%%% 

# function will return row indices of emails where input recipient email string found
# First specify a email string
s = "tana.jones@enron.com"
t <- matrix(sapply(s,function(s) which(apply(DF==s,1,any))),1)

## "t" is a vector of row indices where the function found the input email as a receiver of that
# indexed email
# uncomment to see vector
# View(t)

# following is an example of how it builds each row 
s = "yao.apasu@enron.com"
temp = matrix(sapply(s,function(s) which(apply(DF==s,1,any))),1)
a <- rbind.fill.matrix(t,temp)
View(a)


# Need for use of rbind.fill.matrix
library(plyr)

# forces list of recipients to be a dataframe (only need to run once and reference often)
uni_recip2=as.data.frame(uni_recip)

# Load in row values of uni_recips you wants
test_arr = read.csv("~/Documents/math191/project/itsGaussian/test_arr.csv", header = FALSE)

# due to typing issues and other; define dataframe output as first row of output you want
df = matrix(uni_recip2[test_arr[1,],])

# define the number of rows you have as a double var
k = dim(test_arr)[1]
k = as.numeric(k)

# For loop will output a 1-col matrix-class var holding all the names of the emails you want 
for(i in 2:k){
  temp = matrix(uni_recip2[test_arr[i,],])
  df = rbind(df, temp)
}


# first iteration done b/c of init type errors trouble fixing
s = df[1,]
a = matrix(sapply(s,function(s) which(apply(DF==s,1,any))),1)

# completes the matrix construction, needs further processing before export
for(i in 2:k){
s = df[i,]
temp = matrix(sapply(s,function(s) which(apply(DF==s,1,any))),1)
a <- rbind.fill.matrix(a,temp)
}

# Post processing making matrix ready for matlab
# each column will correspond to an observation == unique person's list of inbox emails
# irrelevant terms are NA atm --> transform to 0

# replaces all na in matrix with a zero 
a[is.na(a)] <- 0

# takes transpose of matrix (want this so each column is an observation)
a <- t(a)

# write matrix to txt file 
write.table(a, file="inbox.txt", row.names=FALSE, col.names=FALSE)
