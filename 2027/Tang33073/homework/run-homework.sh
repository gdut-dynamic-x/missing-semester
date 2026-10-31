#!/bin/bash
# Lesson 1 homework script

# 1. Print current system time
echo "=== Current System Time ==="
date

# 2. Print the last 10 used commands
echo -e "\n=== Last 10 Used Commands ==="
tail -n 10 ~/.bash_history

# 3. Count characters in the notes file
echo -e "\n=== Notes Character Count ==="
wc -m ../notes/lesson1-notes.md
