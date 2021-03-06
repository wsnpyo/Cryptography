# -*- coding: utf-8 -*-
# This file was *autogenerated* from the file GetPrime.sage
from sage.all_cmdline import *   # import sage library
_sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0)
def GetPrime(n) : # get all primes smaller or equal to n
	prime = []
	pd = [_sage_const_1  for i in range(n+_sage_const_1 )]
	pd[_sage_const_1 ] = _sage_const_0 
	for i in range(_sage_const_2 , n+_sage_const_1 ):
		if pd[i] > _sage_const_0  :
			for j in range(i+i, n+_sage_const_1 , i) :
				pd[j] = _sage_const_0 
			prime.append(i)
	return prime

if __name__ == '__main__' :
	print('/*** Get the Primes ***/')
	try :
		n = int(input('Get Primes smaller or euqal to : '))
		P = GetPrime(n)
		print(P[:])
	except :
		print('Error Input !')
