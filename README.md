# MongoDB Replica Set.

## Setup:
<pre>
$ cd ~
$ mkdir -p mongo
$ cd ~/mongo
$ git init
$ git remote add origin git@github.com:williamjxjmove/mongo1.git
$ git pull -u origin master
$ mkdir -p m1 m2 m3

# Startup the mongod Daemon.
$ bin/m6.sh

# Check the daemons running.
$ ps -ef | grep mongod | grep -v grep

# run config file.
$ bin/mm.sh

# Do check by access the ports: 29101, 29102, 29103
$ mongo localhost:29101
$ mongo localhost:29102
$ mongo localhost:29103
</pre>

## Steps:
The bin/m6.sh runs to execute the following steps:
<pre>
$ mongod --dbpath ./m1 --logpath ./m1.log --fork --port 29001 --replSet SetA --smallfiles
$ mongod --dbpath ./m2 --logpath m2.log --fork --port 29002 --replSet SetA  --smallfiles
$ mongod --dbpath ./m3 --logpath m3.log --fork --port 29003 --replSet SetA  --smallfiles
</pre>

## Issues

(1) Previledges:

Default user is <strong>movedev</strong>, which is not security.
<pre>
$ sudo usermod -a -G mongod movedev
</pre>


(2) Dynamic generating directories:
<pre>
cd $HOME/mongo

if [ -d m1 ]; then
	mkdir -p m1 m2 m3
fi
</pre>


