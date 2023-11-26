#!/bin/bash
expdate=$(date \
            --date $(whois "$1" \
              | grep 'Registry Expiry Date:' \
              | awk '{print $4}') \
            +'%Y-%m-%d')
echo "$expdate $1"