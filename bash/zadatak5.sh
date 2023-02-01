#!/bin/bash

date=$(date +"%Y-%m-%d %T")
dir=/tmp/mentoring/logs

echo Please input sentence:
read sentence
echo $date: $sentence > $dir/sentence.log

for i in {1..3}
do
echo Please input sentence:
read sentence
done
