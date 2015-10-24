# -*- coding: utf-8 -*-

def QuickPower(a, n, p):
	tmp = a
	ret = 1
	while (n > 0) :
		if (n & 1):
			ret = (ret * tmp) % p;
		tmp = (tmp * tmp) % p;
		n >>= 1;
	return ret

if __name__ == '__main__':
	print("/*** calc a^n (mod p) ***/")
	try:
		a = int(input('a = '))
		n = int(input('n = '))
		p = int(input('p = '))
		print(QuickPower(a, n, p))
	except:
		print('Error Input !\n')
	
