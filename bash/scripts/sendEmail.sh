#!/bin/bash

awk -F: '$3>=1000 {print $1}' /etc/passwd \
| xargs -I@ echo 'echo "Hi there, @!" | mail -s greetings @' \  
bash