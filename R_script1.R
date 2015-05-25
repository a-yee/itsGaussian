# Load datafile
# Metadata <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)

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
spsword0 <- read.delim("~/Documents/math191/project/itsGaussian/Enron/WordCounts/Sparse_Word_0.txt", header=FALSE)
View(word1)

spsword125 <- read.delim("~/Documents/math191/project/itsGaussian/Enron/WordCounts/Sparse_Word_125.txt", header=FALSE)
View(spsword125)
tail(spsword125)


spsword0TEST <- read.delim("~/pyprog/test2.txt", header=FALSE)
View(spsword0TEST)
