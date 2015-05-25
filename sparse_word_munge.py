# test of creating sparse matrix of all email word frequencies 
# Code written wrt Python 2.7.5

import csv
import numpy as np
from scipy.sparse import csr_matrix

with open("Sparse_Word_0.txt") as tsv: 
    for line in csv.reader(tsv, delimiter = "\t"):
        print line



'''
for iter in range(0,5):
    print "this is number %d" % iter
'''

