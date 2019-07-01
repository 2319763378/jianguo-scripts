#!/bin/bash
filter=$(curl -s $1 |grep -E "hash:|name:")
hash1=$(echo ${filter}|awk -F"'" '{print $2}')
name1=$(echo ${filter}|awk -F"'" '{print $4}')
url=$(curl -s "https://www.jianguoyun.com/d/ajax/fileops/pubFileLink?k=${hash1}&name=${name1}&wm=false&forwin=1"|awk -F'"' '{print $4}')
yum install wget -y
wget -O ${name1} ${url}
