import os

files = []

for file in os.listdir():
        continue
    if os.path.isfile(file):
        files.append(file)

print(files)
