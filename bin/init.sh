#!/bin/bash
# Only execute 1 time at the beginning.

# pkill is better, and kill -2 or -15?
ps -ef | grep mongod |grep -v grep | awk '{print $2}' | while read pid 
do 
  kill -15 $pid
done


cd ~
DIR='mongo'
[ -d "$DIR" ] || mkdir -p "$DIR"
cd $DIR

# git init
# git pull git@github.com:williamjxjmove/mongo.git

for i in `echo m1 m2 m3 log`; do 
  if [ -d "$i" ]; then
    rm -rf $i/*
	else
    # create default dirs for extensions.
	  mkdir -p $i
	fi
done


###################

BASE_DIR=$HOME/$DIR
EXEC_DIR=$HOME/$DIR

echo "No in the directory: <${BASE_DIR}>..."

USER=`whoami`

mongod --config ${EXEC_DIR}/etc/replica_set1.conf

mongod --config ${EXEC_DIR}/etc/replica_set2.conf

mongod --config ${EXEC_DIR}/etc/replica_set3.conf

echo "------------------------------"
echo "Current Mongo Daemong running:"
ps -ef | grep mongod |grep -v grep 
