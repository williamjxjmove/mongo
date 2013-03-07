# MongoDB Replica Set Auto-processing.

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
$ bin/setup1.sh

# Check the daemons running.
$ ps -ef | grep mongod | grep -v grep

# run config file.
$ bin/mongo2.sh

# Do check by access the ports: 29101, 29102, 29103
$ mongo localhost:29101
$ mongo localhost:29102
$ mongo localhost:29103
</pre>

## Steps:
The bin/setup1.sh runs to execute the following steps:
<pre>
create 3 dirs to hold MongoDB replica-set data.
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
# cd $HOME/mongo

[ -d "$HOME/mongo" ] || mkdir -p $HOME/mongo
cd $HOME/mongo
mkdir -p m1 m2 m3

</pre>

