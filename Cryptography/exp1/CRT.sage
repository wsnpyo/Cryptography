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
	return x

def CRT(r, m, n) : # calc x[i] = r[i] % m[i] for i in range(n)
	M = 1
	for i in range(n):
		M *= m[i]
	ans = 0
	for i in range(n):
		ans += r[i] * M // m[i] * Exgcd( M // m[i], m[i] )
	return ans % M

if __name__ == '__main__':
	print('/*** C.R.T ***/')
	try :
		m = []
		r = []
		n = int(input('Equation Number : '))
		for i in range(n):
			print('x = r%d (mod m%d)' % (i+1, i+1))
			r.append(int(input('r%d = ' % (i+1))))
			m.append(int(input('m%d = ' % (i+1))))
		print('x = %d' % CRT(r, m, n))
	except :
		print('Error Input !')
