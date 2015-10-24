# ECC implements ElGamal Signature

def rev(x, N):
	return xgcd(x, N)[1] % N

def ECC_add(x1, y1, x2, y2):
	if x1 == -1 and y1 == -1 :
		return x2, y2
	if x2 == -1 and y2 == -1 :
		return x1, y1
	if x1 == x2 and y1 == y2 :
		if y1 == 0:
			return -1, -1
		else:
			Lambda = (3*x1*x1+a) * rev(2*y1, N) % N
	else :
		if x1 == x2:
			return -1, -1
		else:
			Lambda = (y1-y2) * rev(x1-x2, N) % N
	retx = (Lambda * Lambda - x1 - x2) % N
	rety = (Lambda * (x1 - retx) - y1) % N
	return retx, rety

def ECC_kmul(k, x, y):
	retx, rety = -1, -1
	while k :
		if k & 1 :
			retx, rety = ECC_add(retx, rety, x, y)
		x, y = ECC_add(x, y, x, y)
		k >>= 1
	return retx, rety

def Hash(M):
	return M

class ECC:
	def __init__(self, Pr, Px, Py, n):
		self.Pr = Pr
		self.rank = n
		self.Px, self.Py = Px, Py
		self.Qx, self.Qy = ECC_kmul(self.Pr, Px, Py)

	def Sign(self, M):
		while True:
			while True:
				k = randint(1, self.rank - 1)
				r, y = ECC_kmul(k, self.Px, self.Py)
				if r != 0:
					break
			e = Hash(M)
			s = rev(k, self.rank) * (e + r * self.Pr) % self.rank
			if s != 0:
				break
		return r, s

def Verify(M, r, s, Px, Py, Qx, Qy, rank):
	if not (1 <= r and r <= rank-1 and 1 <= s and s <= rank-1) :
		return false
	e = Hash(M)
	u1 = e * rev(s, rank) % rank
	u2 = r * rev(s, rank) % rank
	tPx, tPy = ECC_kmul(u1, Px, Py)
	tQx, tQy = ECC_kmul(u2, Qx, Qy)
	if tPx == -1 or tQx == -1:
		return False
	v, tXy = ECC_add(tPx, tPy, tQx, tQy)
	if v == r:
		return True
	else:
		return False

def main():
	print("/******  ECC-signature  ******/")

	# print("ECC initialize : ")
	global a, b, N
	# a = int(raw_input("- a : "), 16)
	# b = int(raw_input("- b : "), 16)
	# N = int(raw_input("- N : "), 16)

	# print("ECC Generate Point : ")
	# Px = int(raw_input("Px (hex) : "), 16)
	# Py = int(raw_input("Py (hex) : "), 16)

	# M = int(raw_input("M (hex) : "), 16)

	N=int("FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF", 16)
	a=int("FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFC", 16)
	b=int("28E9FA9E9D9F5E344D5A9E4BCF6509A7F39789F515AB8F92DDBCBD414D940E93", 16)
	Px=int("32C4AE2C1F1981195F9904466A39C9948FE30BBFF2660BE1715A4589334C74C7", 16)
	Py=int("BC3736A2F4F6779C59BDCEE36B692153D0A9877CC62A474002DF32E52139F0A0", 16)
	n=int("FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF7203DF6B21C6052B53BBF40939D54123", 16)

	if (4 * a * a * a + 27 * b * b) % N == 0 :
		print("Error Curve !")
		exit()

	if Py * Py % N != (Px * Px * Px + a * Px + b) % N :
		print("Error Point !")
		exit()

	# Generate Signature
	Pr = int(raw_input("Key (40-hex) : "), 16)
	M = int(raw_input("PlainText (40-hex) : "), 16)
	ecc = ECC(Pr, Px, Py, n)
	r, s = ecc.Sign(M)
	print("Signature :\nr = %x\ns = %x" % (r, s))

	# Verify signature
	print("Verify : %d" % Verify(M, r, s, ecc.Px, ecc.Py, ecc.Qx, ecc.Qy, ecc.rank))

if __name__ == '__main__':
	main()
