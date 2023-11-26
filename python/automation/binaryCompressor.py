import bz2

data = b"""\
This is a test. ."""

with bz2.open("compressedFile.bz2", "wb") as f:
    #write compressed data to a file
    compressed_file = f.write(data)
with bz2.open("compressedFile.bz2", "rb") as f:
    # Decompress data from a file
    content = f.read()
content == data #check equality to original object 