# -*- coding: utf-8 -*-

def Exgcd(r0, r1): # calc r0*x + r1*y = gcd(r0, r1), which returns gcd(r0, r1)
	x0, y0 = 1, 0                # that x0 * r0 + y0 * r1 = r0
	x1, y1 = 0, 1                # that x1 * r0 + y1 * r1 = r1
	r = r0 %  r1                 # calc x  * r0 + y  * r1 = r
	q = r0 // r1
	while r > 0 :
		x , y  = x0 - x1 * q, y0 - y1 * q
		x0, y0 = x1, y1
		x1, y1 = x , y
		r0, r1 = r1, r
		r = r0 %  r1
		q = r0 // r1
	return x, y, r1

if __name__ == '__main__' :
	print('/*** Exgcd Algorithm : calc a*x + b*y = (a, b) ***/')
	try:
		a = int(input('a = '))
		b = int(input('b = '))
		ANS = Exgcd(a, b)
		print('x = %d y = %d (a, b) = %d' % ANS)
	except :
		print('Error Input !')
		
