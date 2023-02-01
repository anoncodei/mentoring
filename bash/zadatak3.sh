#!/bin/bash

date=$(date +"%d-%m-%Y")

tar -czvf backup.$date.tar.gz /tmp/mentoring/subdirectories/
mv backup.$date.tar.gz /tmp/mentoring/backup
