from collections import Counter
from itertools import *
from string import *

def gettrans(List, ALLList):
	s = ""
	ns = ""
	for i in range(len(List)):
		s += List[i]
		ns += frequency[i]
	for i in range(len(List), len(ALLList)):
		s += ALLList[i]
		ns += frequency[i]
	return s, ns

frequency = ['e', 't', 'a', 'o', 'n', 'r', 'i', 's', 'h', 'd', 'l', 'f', 'c', 'm', 'u', 'g', 'y', 'p', 'w', 'b', 'v', 'k', 'j', 'x', 'q', 'z']

print("/***  frequency attack  ***/")
n = int(input("find n maximum probablity : "))
CipherText = raw_input("cipherText : ")

tmp = Counter(CipherText)
freq = dict(tmp.most_common(len(tmp))).keys() # get the frequency sorted table
# print(freq)

HASH = {} # in case same permutation

for i in range(1, len(freq)+1):
	perList = list(permutations(freq[0:i], i)) # genelization permutation
	for j in range(len(perList)):
		s, ns = gettrans(perList[j], freq)
		if s in HASH:
			continue
		trans = maketrans(s, ns)
		print("%s ==> %s" % (s, ns))
		print(CipherText.translate(trans))
		HASH[s] = 1
		n = n-1
		if n == 0:
			break
	if n == 0:
		break
if n != 0:
	print("Have try all the permutation !")
