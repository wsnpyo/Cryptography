IP = [
		58,50,42,34,26,18,10,2,
		60,52,44,36,28,20,12,4, 
		62,54,46,38,30,22,14,6,
		64,56,48,40,32,24,16,8, 
		57,49,41,33,25,17,9,1,
		59,51,43,35,27,19,11,3, 
		61,53,45,37,29,21,13,5,
		63,55,47,39,31,23,15,7 
]

IP_inv = [
		40,8,48,16,56,24,64,32,39,7,47,15,55,23,63,31, 
		38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29, 
		36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27, 
		34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25 
]

Shift = [
    1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1 
]

Extend = [
		32,1,2,3,4,5,4,5,6,7,8,9, 
		8,9,10,11,12,13,12,13,14,15,16,17, 
		16,17,18,19,20,21,20,21,22,23,24,25, 
		24,25,26,27,28,29,28,29,30,31,32,1 
]

P = [
		16,7,20,21,29,12,28,17,1,15,23,26,5,18,31,10, 
		2,8,24,14,32,27,3,9,19,13,30,6,22,11,4,25 
]

P_inv = [
		9,17,23,31,13,28,2,18,24,16,30,6,26,20,10,1,
		8,14,25,3,4,29,11,19,32,12,22,7,5,27,15,21
]

S_Box = [
		#  S1  
		[
		[14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7],
		[0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8], 
		[4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0], 
		[15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13]
		],
		# S2 
		[
		[15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10], 
		[3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5], 
		[0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15], 
		[13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9]
		],
		# S3 
		[
		[10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8], 
		[13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1], 
		[13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7], 
		[1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12]
		],
		# S4 
		[
		[7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15], 
		[13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9], 
		[10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4], 
		[3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14] 
		],
		# S5 
		[
		[2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9], 
		[14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6], 
		[4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14], 
		[11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3] 
		],
		# S6 
		[
		[12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11],
		[10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8], 
		[9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6], 
		[4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13] 
		],
		# S7 
		[
		[4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1], 
		[13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6], 
		[1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2], 
		[6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12]
		],
		# S8 
		[
		[13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7], 
		[1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2], 
		[7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8], 
		[2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11]
		]
]

PC_2inv = [
	5, 24, 7, 16, 6, 10, 20, 
	18, 0, 12, 3, 15, 23, 1, 
	9, 19, 2, 0, 14, 22, 11, 
	0, 13, 4, 0, 17, 21, 8, 
	47, 31, 27, 48, 35, 41, 0, 
	46, 28, 0, 39, 32, 25, 44, 
	0, 37, 34, 43, 29, 36, 38, 
	45, 33, 26, 42, 0, 30, 40
]

# list index from left to right
def List_to_Num(List, n):
	b = 0
	for i in range(n):
		b = b*2+List[i]
	return b

def Num_to_List(b, n):
	List = []
	for i in range(n):
		List.append(b % 2)
		b = b//2
	List.reverse()
	return List

def leftshift(List, dist):
	retList = []
	for i in range(len(List)):
		retList.append(0)
	for i in range(len(List)):
		retList[i] = List[(i+dist)%len(List)]
	return retList

def rightshift(List, dist):
	retList = []
	for i in range(len(List)):
		retList.append(0)
	for i in range(len(List)):
		retList[i] = List[(i-dist)%len(List)]
	return retList

def Substitute(List, Table):
	retList = [0 for i in range(len(Table))]
	for i in range(len(Table)):
		if Table[i] == 0:
			retList[i] = -1
		else:
			retList[i] = List[ Table[i] - 1 ]
	return retList

def XOR(List1, List2):
	retList = []
	for i in range(len(List2)):
		if((List1[i] == 0 and List2[i] == 1) or (List1[i] == 1 and List2[i] == 0)):
			retList.append(1)
		else:
			retList.append(0)
	return retList

# Statistics S-box output Distribution
def STransformSingle(R, i):
	x = (R[0] << 1) + (R[5])
	y = (R[1] << 3) + (R[2] << 2) + (R[3] << 1) + R[4]
	return S_Box[i][x][y]

def STransform(R):
	retR = []
	for i in range(8):
		x = (R[i*6] << 1) + (R[i*6+5])
		y = (R[i*6+1] << 3) + (R[i*6+2] << 2) + (R[i*6+3] << 1) + (R[i*6+4])
		retR.extend(Num_to_List(S_Box[i][x][y], 4))
	return retR

def Statistics():
	IN = [[[[] for k in range(16)] for j in range(64)] for i in range(8)]
	for i in range(8):
		for j in range(64):
			Bp = Num_to_List(j, 6)
			for k in range(64):
				B = Num_to_List(k, 6)
				Sb = Num_to_List(STransformSingle(B, i), 4)
				Sbx = Num_to_List(STransformSingle(XOR(B, Bp), i), 4)
				IN[i][j][List_to_Num(XOR(Sb, Sbx), 4)].append(k)
	return IN

def UpdateKeySet(KeySet, E, Ex, Cp):
	for i in range(8):
		tE = E[i*6:(i+1)*6]
		tEx = Ex[i*6:(i+1)*6]
		tCp = Cp[i*4:(i+1)*4]
		# print tE, tEx, tCp
		tIN = IN[i][List_to_Num(XOR(tE, tEx), 6)][List_to_Num(tCp, 4)]
		tJ = []
		for j in range(len(tIN)):
			tJ.append(List_to_Num(XOR(Num_to_List(tIN[j], 6), tE), 6))
		# print(tJ)
		KeySet[i] = KeySet[i] & set(tJ)

def Diff(KeySet, P1, C1, P2, C2):
	L = [0 for i in range(17)]
	R = [0 for i in range(17)]
	Lx = [0 for i in range(17)]
	Rx = [0 for i in range(17)]
	Lp = [0 for i in range(17)]
	Rp = [0 for i in range(17)]

	# print("%x" % (List_to_Num(C1, 64)))

	P1 = Substitute(P1, IP)
	C1 = Substitute(C1, IP)
	P2 = Substitute(P2, IP)
	C2 = Substitute(C2, IP)

	C1[0:32], C1[32:64] = C1[32:64], C1[0:32]
	C2[0:32], C2[32:64] = C2[32:64], C2[0:32]

	# print("Round 0 -> P1 : %x" % (List_to_Num(P1, 64)))
	# print("Round 3 -> C1 : %x" % (List_to_Num(C1, 64)))

	L[0], R[0] = P1[0:32], P1[32:64]
	L[3], R[3] = C1[0:32], C1[32:64]
	Lx[0], Rx[0] = P2[0:32], P2[32:64]
	Lx[3], Rx[3] = C2[0:32], C2[32:64]
	Lp[0], Rp[0] = XOR(L[0], Lx[0]), XOR(R[0], Rx[0])
	Lp[3], Rp[3] = XOR(L[3], Lx[3]), XOR(R[3], Rx[3])

	E = Substitute(L[3], Extend) 				#48
	Ex = Substitute(Lx[3], Extend)				#48
	Cp = Substitute(XOR(Rp[3], Lp[0]), P_inv)	#32

	# Get the potential Key
	UpdateKeySet(KeySet, E, Ex, Cp)

	print("Key Set Status :")
	for i in range(8):
		tmp = list(KeySet[i])
		print "\tKey %d :" % (i+1), "\t", tmp

KeySet = [set([i for i in range(64)]) for j in range(8)]

P1 = []
P2 = []
C1 = []
C2 = []

# P1.append(int("02468aceeca86420", 16))
# C1.append(int("ee5f19f58d3e20b9", 16))

# P2.append(int("5713df9bb9fd3175", 16))
# C2.append(int("7df7691c3f3f7b7a", 16))

# P1.append(int("8765432112345678", 16))
# C1.append(int("679bb0b496aa159f", 16))

# P2.append(int("d23016744761032d", 16))
# C2.append(int("e36b490f2f8fd64c", 16))

# P1.append(int("1112223334445556", 16))
# C1.append(int("7a17569e2caad56a", 16))

# P2.append(int("4447776661110003", 16))
# C2.append(int("1c7640805819f6d7", 16))

print "/********  diff attack  ********/"

IN = Statistics()

flag = 1
i = 0

while flag:
	P1.append(int(raw_input("P1(hex) : "), 16))
	C1.append(int(raw_input("C1(hex) : "), 16))
	P2.append(int(raw_input("P2(hex) : "), 16))
	C2.append(int(raw_input("C2(hex) : "), 16))
	Plain1 = Num_to_List(P1[-1], 64)
	Cipher1 = Num_to_List(C1[-1], 64)
	Plain2 = Num_to_List(P2[-1], 64)
	Cipher2 = Num_to_List(C2[-1], 64)
	print "======= Attack %d =======" % (i+1)
	i += 1
	Diff(KeySet, Plain1, Cipher1, Plain2, Cipher2)
	flag = 0
	for j in range(8):
		if len(list(KeySet[j])) != 1:
			flag = 1
	print "!!!!!  Still Need PlainTexts and CipherTexts  !!!!!"

Cipher = []
for i in range(8):
	Cipher.extend(Num_to_List(list(KeySet[i])[0], 6))

Cipher = Substitute(Cipher, PC_2inv)
Cipher[0:28], Cipher[28:56] = rightshift(Cipher[0:28], 4), rightshift(Cipher[28:56], 4)

load("DES_module.sage")

# enumerate the rest 8 bit to makeup 56's key
print "Start Enumerate the rest 8bit :"
for i in range(256):
	j = 0
	tmpCipher = [Cipher[k] for k in range(56)]
	for k in range(56):
		if tmpCipher[k] == -1:
			tmpCipher[k] = ((i >> j) & 1)
			j += 1
	# print tmpCipher
	flag = 0
	for k in range(len(P1)):
		# print "%016x" % diff_create(P1[k], List_to_Num(tmpCipher, 56), 3)
		if diff_create(P1[k], List_to_Num(tmpCipher, 56), 3) == C1[k]:
			flag += 1
		if diff_create(P2[k], List_to_Num(tmpCipher, 56), 3) == C2[k]:
			flag += 1
	print "enumerate %d, correct Number %d: " % (i, flag)
	if flag == 6:
		Cipher = tmpCipher
		break

# print Cipher
print "Key (after PC_1): %014x" % List_to_Num(Cipher, 56)


