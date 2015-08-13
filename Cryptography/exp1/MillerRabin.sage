# -*- coding: utf-8 -*-

import random

def QuickPower(a, n, p):
	tmp = a
	ret = 1
	while (n > 0) :
		if n & 1 == 1:
			ret = (ret * tmp) % p
		tmp = (tmp * tmp) % p
		n >>= 1;
	return ret

def MillerRabin(x, ran): # calc x-1 = 2^s*t
	tx = x - 1
	# pick out the last '1' in binary tx, which is 2^s
	tx1 = tx
	s2 = 1
	while tx1 & 1 == 0 :
		tx1 >>= 1
		s2 <<= 1
	r = QuickPower(ran, tx // s2, x)
	if r == 1 or r == tx:
		return True
	while s2>1:
      		r = (r*r)%x
	        if r == 1:
        		return False
	        if r == tx:
	        	return True
	        s2 >>= 1
	return False

def MillerRabin_Test(x, T): # Miller-Rabin Prime Test
	if x < 2:
        	return False
    	if x <= 3:
        	return True
	if x%2 == 0 or x%3 == 0:
        	return False
    	for i in range(T): # choose T numbers randomly
        	ran = random.randint(2, x-2)
        	if not MillerRabin(x, ran):
            		return False
	return True

if __name__ == '__main__':
	print("/*** Miller-Rabin Prime Test ***/")
	try :
		x = int(input('Test X : '))
		T = int(input('Test Times : '))
		if MillerRabin_Test(x, T) :
			print('This is a Prime')
		else :
			print("This isn't a Prime")
	except:
		print('Error Input !')
