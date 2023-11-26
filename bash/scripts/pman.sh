#!/bin/bash
PROGRAM=$(basename $0)
# use the encrypted file 
DATABASE=$HOME/etc/vault.gpg

if [ $# -ne ]; then
    >&2 echo "$PROGRAM: look up passwords"
    >&2 echo "Usage: $PROGRAM string"
    exit 1
fi
searchstring="$1"

#store the encrypted text in a variable
decrypted=$(gpg -d -q "$DATABASE" | grep -v '^#')

# Look for exact matches in third column.
match=$(echo "$decrypted" |  awk '$3~/^'/$searchstring'$/')

# If the search string doesn't match a key, find all matches
if [ -z "$match" ]; then
    match=$(echo "$decrypted" | awk "/$searchstring/")
fi

# If still no match, pring an error message and exit

if [ -z "$match" ]; then
    >&2 echo "$PROGRAM: no matches for '$searchstring'"
    exit 1
fi

# Print the match 
echo $match