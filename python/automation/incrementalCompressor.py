import bz2

def gen_data(chunks=10, chunksize=1000):
    """Yield incremental blocks of chunksize bytes."""
    for _ in range(chunks):
        yield b"z" * chunksize

comp = bz2.BZ2Compressor()
out = b""
for chunk in gen_data():
    out = out + comp.compress(chunk)


out = oout + comp.flush()