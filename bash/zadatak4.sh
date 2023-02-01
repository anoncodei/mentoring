#!/bin/bash

sudo apt-get install wamerican
cp /usr/share/dict/american-english /tmp/mentoring
echo
echo Please input a word:
read word
echo
echo Results:
grep -x $word /usr/share/dict/american-english
