#!/usr/bin/python
def Hash(Text, le):
	return Text^le % (1 << le)

def G(Text, lb, le):
	return Hash(Text, le)

def H(Text, lb, le):
	return Hash(Text, le)

def xor(a, b):
	Inv = (1 << (binlen(a) + binlen(b))) - 1
	return (a & (Inv - b)) | (b & (Inv - a))

def binlen(X):
	return len(str(bin(X))) - 2

def QuickPower(a, n, p):
	tmp = a
	ret = 1
	while (n > 0) :
		if (n & 1):
			ret = (ret * tmp) % p;
		tmp = (tmp * tmp) % p;
		n >>= 1;
	return ret

def InitKey() :	
	print '>>> Init Keys'
	# find p * q > m
	p = random_prime((1 << 512) - 1)
	q = random_prime((1 << 512) - 1)
	N = p * q
	phiN = (p-1) * (q-1)

	print "Random P : ", hex(p)
	print "Random Q : ", hex(q)
	print "Mod N : ", hex(N)

	e = randint(1, phiN)
	while gcd(e, phiN) != 1 :
		e = randint(1, phiN)
	d = xgcd(e, phiN)[1] % phiN

	print "Cipher Key : ", hex(e)
	print "Public Key : ", hex(d)

	k = binlen(N)
	k0 = 100
	k1 = 100
	mlen = k - k0 - k1

	print "k : ", hex(k)
	print "k0 : ", hex(k0)
	print "k1 : ", hex(k1)

	print "----------- Initialize Finished -----------"

	f = open("RSA_data.txt", "w")
	f.write(str(e)+'\n')
	f.write(str(d)+'\n')
	f.write(str(N)+'\n')
	f.close()

	return e, d, N

def RSAEncrypt(m):
	print '>>> Encrypt'
	f = open("RSA_data.txt", "r")
	e = int(f.readline())
	d = int(f.readline())
	N = int(f.readline())
	f.close()
	k = binlen(N)
	k0 = 100
	k1 = 100

	m = (m << 1) + 1
	m = m << (k - k0 - k1 - binlen(m) - 1)
	r = randint(1, (1 << k0) - 1)
	s = xor(m << k1, G(r, k0, k-k0))
	t = xor(r, H(s, k-k0, k0))

	if (s << k0) + t >= N :
		return 0

	c = QuickPower((s << k0) + t, e, N)

	print "Cipher Text : ", hex(c)

	f = open("CipherText.txt", "w")
	f.write(str(c)+'\n')
	f.close()
	return c

def RSADecrypt(c):
	print '>>> Decrypt'
	f = open("RSA_data.txt", "r")
	e = int(f.readline())
	d = int(f.readline())
	N = int(f.readline())
	f.close()
	k = binlen(N)
	k0 = 100
	k1 = 100

	f = open("CipherText.txt", "r")
	c = int(f.readline())
	f.close()

	s_t = QuickPower(c, d, N)

	s = s_t >> k0
	t = s_t & ((1 << k0) - 1)
	r = xor(t, H(s, k-k0, k0))
	v = xor(s, G(r, k0, k-k0))

	if v & ((1 << k1) - 1) != 0 :
		print "Wrong"
		return

	while v & 1 == 0 :
		v >>= 1
	v >>= 1
	print "Plain Text : ", hex(v)

def main():
	print("/***  RSA-OAEP  ***/")
	# pd = int(raw_input("Encrypt(0) or Decrypt(1) : "))
	PlainText = int(raw_input("Plain Text (hex): "), 16)
	CipherText = 0
	while True :
		InitKey()
		CipherText = RSAEncrypt(PlainText)
		if CipherText != 0 :
			break
		print 'Initialize False ----> restart ----> '

	RSADecrypt(CipherText)

if __name__ == '__main__':
	main()