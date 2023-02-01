#!/bin/bash

dir=/tmp/mentoring

ps -Ao comm,pid,pcpu,pmem --sort=-pcpu | head -n 10 > $dir/process_list.txt
