# Load datafile
# Metadata <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)

# drops column 3 of id values
Metadata$V3 = NULL
View(Metadata)

MetadataOrig <- read.delim("~/Documents/math191/project/itsGaussian/Enron/Metadata.tsv", header=FALSE)
View(MetadataOrig)
MetadataOrig <- MetadataOrig[-698,]
View(MetadataOrig)

MetadataOrig$V3 = NULL
MetadataOrig$row.names = NULL

