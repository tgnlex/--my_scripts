#!/bin/bash
## Enhanced Duplicate File detector using an AWK script. 

md5sum *.jpg \
  | awk '{counts[$1]++; names[$1]=names[$1] " " $2} \
         END {for (key in counts) print counts[key] " " key ":" names[key]}' \
  | grep -v '^1 ' \
  | sort -nr