#!/bin/bash 

x=1 

while read -r line; do 
echo "Line $x $Line"
((x ++))
done < filename