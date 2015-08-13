# -*- coding: utf-8 -*-

def GetPrime(n) : # get all primes smaller or equal to n
	prime = []
	pd = [1 for i in range(n+1)]
	pd[1] = 0
	for i in range(2, n+1):
		if pd[i] > 0 :
			for j in range(i+i, n+1, i) :
				pd[j] = 0
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
