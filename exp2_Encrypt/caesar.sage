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

def gcd(a, b):
	if(a == 0):
		return b
	return gcd(b%a, a)

def encrypt(a, b, c):
	s = ""
	for i in range(len(c)):
		s = s + chr(ord('a') + ((ord(c[i])-ord('a')) * a + b)%26)
	print(s)

def decrypt(a, b, c):
	ai = Exgcd(a, 26)
	s = ""
	for i in range(len(c)):
		s = s +chr(ord('a') + ((ord(c[i])-ord('a')-b+26)%26 * ai)%26)
	print(s)

if __name__ == '__main__':
	print("/***  Caesar Encrypt  ***/")
	try:
		pd = int(input('Choose Encrypt(0) or Decrypt(1)?(0/1) '))
		a = int(input('a = '))
		if(gcd(a, 26) != 1):
			print('a and 26 must be coprime')
		else:
			b = int(input('b = '))
			if pd == 1:
				c = raw_input('ciphertext (English Words) :')
				decrypt(a, b, c)
			else:
				c = raw_input('plaintext (English Words) : ')
				encrypt(a, b, c)
	except:
		print('Error Input !\n')