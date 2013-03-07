# MongoDB Replica Set.

cd $HOME/mongo

if [ -d m1 ]; then
	mkdir -p m1 m2 m3
fi

mongod --dbpath ./m1 --logpath ./m1.log --fork --port 29001 --replSet SetA --smallfiles

mongod --dbpath ./m2 --logpath m2.log --fork --port 29002 --replSet SetA  --smallfiles

mongod --dbpath ./m3 --logpath m3.log --fork --port 29003 --replSet SetA  --smallfiles

# user: movedev, 

 sudo usermod -a -G mongod movedev


 movedev   5217     1  0 17:47 ?        00:00:00 mongod --config /home/movedev/mongo/etc/replica_set1.conf
 movedev   5266     1  0 17:47 ?        00:00:00 mongod --config /home/movedev/mongo/etc/replica_set2.conf
 movedev   5311     1  0 17:47 ?        00:00:00 mongod --config /home/movedev/mongo/etc/replica_set3.conf

