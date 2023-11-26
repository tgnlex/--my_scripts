#!/bin/bash
head -n5 /etc/passwd | cut -d: -f1 | sort  