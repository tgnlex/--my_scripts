# ------------------------------------ #
# Define function hexdump()            # 
# Output is hexidecimal and plainText. #
# Example: hexdump('testing\n')        #
# Used in tcpProxy script.             #
# -------------------------------------#
HEX_FILTER = ''.join(
    [(len(repr(chr(i))) == 3) and chr(i) or '.' for i in range(256)])
def hexdump(src, length=16, show=True):
    if isinstance(src, bytes):
        src = src.decode()

    results = list()
    for i in range(0, len(src), length):
        word = str(src[i:i+length])

        printable = word.translate(HEX_FILTER)
        hexa = ' '.join([f'{ord(c):02X}' for c in word ])
        hexwidth = length*3
        results.append(f'{i:04x} {hexa:<{hexwidth}} {printable}')
    if show: 
        for line in results:
            print(line)
    else: 
        return results
    