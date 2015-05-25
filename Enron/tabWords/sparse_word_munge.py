# test of creating sparse matrix of all email word frequencies 
# Code written wrt Python 2.7.5

import csv
import numpy as np
import scipy.sparse as sps


# For txt files 0-124 reads in vals and creates vect for sparse intit
TXTENT = 2000
NUMWORD = 684928
row = []
col = []
data = []
with open("Sparse_Word_0.txt") as tsv: 
    for line in csv.reader(tsv, delimiter = "\t"):
        print line
        row = np.append(row,line[0])
        #col = np.append(col,line[1])
        #data = np.append(data, line[2])

# Creates sparse matrix of one txt file
#sps_acc = sps.coo_matrix( (data, (row,col) ), shape = (TXTENT, NUMWORD) ).todense()


'''
for iter in range(0,5):
    print "this is number %d" % iter
'''

