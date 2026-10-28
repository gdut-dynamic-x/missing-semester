#!/bin/bash

echo "===== 系统时间 ====="
date

echo "===== 最近使用的10条命令 ====="
cat ~/.bash_history | tail -n 10

echo "===== 笔记的字数 ====="
wc -w ../notes/linux_basic_notes.md
