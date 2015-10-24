R.<x> = GF(2)[]

def multinomial_input():
	f = 0 * x^0
	coefficient = raw_input().split(" ")
	for i in range(len(coefficient)):
		if coefficient[i] == '1':
			f = f + x^i
	return f

def Exgcd(f, g): # f * x + g * y = (f, g)
	if g.degree() < 0 or f.degree() < g.degree():
		print("Expect 0 <= degree(g) <= degree(f)") 
		return None, None
	x1, y1, r1 = 1, 0, f
	x2, y2, r2 = 0, 1, g
	r = f % g
	while r2.degree() > 0 :
		q = r1.quo_rem(r2)[0]
		x, y, r = x1 - q * x2, y1 - q * y2, r1 - q * r2
		x1, y1, r1 = x2, y2, r2
		x2, y2, r2 = x, y, r
	if r2 == 0 or r2.degree() == 0:
		return x2, y2, r2

print("/****** Exgcd on GF(2^n) *******/")
print("please input like '0 1 1' which means x^1 + x^2")
print("calc : f * X + g * Y = (f, g)")
print("multinomial f: ")
f = multinomial_input()
print("multinomial g: ")
g = multinomial_input()

x, y, r = Exgcd(f, g)

print("(f: %s) * (%s) + (g: %s) * (%s) = %s" % (f, x, g, y, r))

