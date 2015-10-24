# -*- coding: utf-8 -*-

def get(a):
	for i in range(n):
		for j in range(n):
			a[i][j] = ord(a[i][j]) - ord('a')

def init(c):
	for i in range(n):
		d = []
		for j in range(n):
			d.append(0)
		c.append(d)

def getInverse(n, a):
	c = []
	init(c)
	a = a.inverse()
	for i in range(n):
		for j in range(n):
			if(str(a[i][j]).find('/') != -1):
				c[i][j] = int(str(a[i][j]).split('/')[0]) * inverse_mod(int(str(a[i][j]).split('/')[1]), 26) % 26
			else:
				c[i][j] = int(str(a[i][j])) % 26
	c = matrix(c)
	return c

if __name__ == '__main__':
	print("/***  Hill Decipher ***/")
	n = int(input("N dimemsion Cipher : "))
	P = []
	C = []
	print("N plainText:")
	for i in range(n):
		line = raw_input()
		P.append([line[i] for i in range(n)])
	get(P)
	P = matrix(P)
	if(not P.is_singular() and P.det() % 2 != 0 and P.det() != 13):
		print("N cipherText:")
		for i in range(n):
			line = raw_input()
			C.append([line[i] for i in range(n)])
		get(C)
		C = matrix(C)
		ANS = getInverse(n, P) * C
		ans = []
		init(ans)
		for i in range(n):
			for j in range(n):
				ans[i][j] = int(str(ANS[i][j])) % 26
		print("cipher : ")
		print(ans)
	else:
		print("plainText matrix is not singular or det and 26 is not coprime ")
