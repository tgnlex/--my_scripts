#!/bin/bash

# Print a prompt
echo -n '$ '

# Read user's input in a loop, exit when user presses ctrl+D
while read line; do

# Ignore the input $line and print a message 
echo "I'm sorry I can't do that"

# Print the next prompt
echo -n '$ '