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

def Fermat(x, T): # Fermat Test
	if x < 2 :
		return False
	if x <= 3 :
		return True
	if x % 2 == 0 or x % 3 == 0 :
		return False
	for i in range(T):
		tmp = random.randint(2, x-2) # pick a random number in [2, x-2]
		if QuickPower(tmp, x-1, x) != 1 :
			return False
	return True

if __name__ == '__main__' :
	print('/*** Fermat Prime Test ***/')
	try:
		x = int(input('Test for x : '))
		T = int(input('Test times : '))
	except:
		print('Error Input !')
	if Fermat(x, T):
		print('This is a prime')
	else:
		print("This isn't a prime")
