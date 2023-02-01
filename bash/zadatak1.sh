#!/bin/bash

mentoring=/tmp/mentoring
backup=/tmp/mentoring/backup
logs=/tmp/mentoring/logs
subdirectories=/tmp/mentoring/subdirectories
shuffle=`shuf -n10 /home/clg/scripts/english-words`

[ ! -d "$mentoring" ] && mkdir -p "$mentoring"
[ ! -d "$backup" ] && mkdir -p "$backup"
[ ! -d "$logs" ] && mkdir -p "$logs"
[ ! -d "$subdirectories" ] && mkdir -p "$subdirectories"

cd $subdirectories && mkdir -p $shuffle
