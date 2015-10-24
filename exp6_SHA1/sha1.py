def LeftRotate(s, bit):
    return ((s << bit) | (s >> (32-bit))) & 0xffffffff

def SHA1(M):
    # use len(M) as suffix
    suffix = str(hex(len(M) * 4))[2:]
    # append to 448 (mod 512)
    M += '8' + '0' * ((-64 - len(M)*4 - 4) % 512 // 4) + '0' * (16 - len(suffix)) + suffix
    # Initialize the five cache    
    A, B, C, D, E = 0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0
    K = [0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6]
    W = [0 for i in range(80)]
    
    for i in range(0, len(M), 128):
        a, b, c, d, e = A, B, C, D, E
        for j in range(0, 80):
            # calc Ws
            if j < 16:
                W[j] = int(M[i+j*8:i+j*8+8], 16)
            else:
                W[j] = LeftRotate(W[j-16] ^ W[j-14] ^ W[j-8] ^ W[j-3], 1)
            # calc F(b, c, d)
            if j < 20:
                f = d ^ (b & (c ^ d))
            elif j < 40:
                f = b ^ c ^ d
            elif j < 60:
                f = (b & c) | (b & d) | (c & d) 
            elif j < 80:
                f = b ^ c ^ d
            a, b, c, d, e = (e + f + LeftRotate(a, 5) + W[j] + K[j//20]) & 0xffffffff, a, LeftRotate(b, 30), c, d
        A, B, C, D, E = (A + a) & 0xffffffff, (B + b) & 0xffffffff, (C + c) & 0xffffffff, (D + d) & 0xffffffff, (E + e) & 0xffffffff

    return '%08x%08x%08x%08x%08x' % (A, B, C, D, E)

def main():
    print('/******  SHA-1  ******/')
    M = input('PlainText(hex) : ')
    print('SHA-1 Hash : %s' % SHA1(M))

if __name__ == '__main__':
    main()
