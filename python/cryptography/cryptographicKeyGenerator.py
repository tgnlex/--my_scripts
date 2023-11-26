import os 
from cryptography.fernet import Fernet

key = Fernet.generate_key()

print(key)

with open("thekey.key", "wb") as thekey:
          thekey.write(key) 

