#!/bin/bash
yes 'shuf -n $RANDOM -o $(pwgen -N1 10).txt /usr/share/dict/words' \
| head -n 1000 \
| bash