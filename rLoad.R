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
t <- sapply(s,function(s) which(apply(DF==s,1,any)));

## "t" is a vector of row indices where the function found the input email as a receiver of that
# indexed email
# uncomment to see vector
# View(t)
