#!/bin/bash

for filename in * 
do 
    badname='echo "$filename" | sed -n '/[\+\{\;\"\\\=\?~\(\)\<\>\&\*\|\$]/p`

    rm $badname 

done 

find . -name "* *" -exec rm -f {} \;

exit 0