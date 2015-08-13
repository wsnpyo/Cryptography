# -*- coding: utf-8 -*-
import random

def QuickPower(a, n, p): # calc a^n mod p
	tmp = a
	ret = 1
	while (n > 0) :
		if (n & 1):
			ret = (ret * tmp) % p;
		tmp = (tmp * tmp) % p;
		n >>= 1;
	return ret

def Jacobi(n, m) : # calc Jacobi(n / m)
	n = n % m
	if n == 0:
		return 0
	Jacobi2 = 1
	if not (n & 1): # if n is even, calc Jacobi2 = Jacobi(2/m)^s where n = 2^s*t(t is odd)
		k = (-1)^(((m*m - 1)//8)&1)
		while not (n & 1):
			Jacobi2 *= k
			n >>= 1
	if n == 1:
		return Jacobi2
	return Jacobi2 * (-1) ^ (((m-1)//2 * (n-1)//2) &1) * Jacobi(m % n, n)

def Solovay_Stassen(x, T) : # Solovay_Stassen test
	if x < 2 :
		return False
	if x <= 3 :
		return True
	if x % 2 == 0 or x % 3 == 0 :
		return False
	for i in range(T) :
		tmp = random.randint(2, x-2)
		r = QuickPower(tmp, (x-1)//2, x)
		if r != 1 and r != x-1 :
			return False
		if r == x-1 :
			r = -1
		if r != Jacobi(tmp, x):
			return False
	return True

if __name__ == '__main__' :
	print('/*** Solovay_Stassen Prime Test ***/')
	try:
		x = int(input('Test for x : '))
		T = int(input('Test Times : '))
		if Solovay_Stassen(x, T) :
			print('This is a prime')
		else :
			print("This isn't a prime")
	except:
		print('Error Input')
