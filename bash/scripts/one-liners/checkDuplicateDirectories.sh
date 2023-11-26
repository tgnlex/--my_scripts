#!/bin/bash
## Run this command while in home directory  
## Checks for duplicate subdirectory names in the first 2 levels of home
## If the output displays any accounts greater than 1 you have duplicates

ls -d */  && (ls -d */*/ | cut -d/ -f2-) | sort | uniq -c | sort -nr | less 