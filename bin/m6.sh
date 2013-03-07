#! /bin/bash

# mongo test --eval "printjson(db.getCollectionNames())"


mongod --config /home/movedev/mongo/etc/replica_set1.conf

mongod --config /home/movedev/mongo/etc/replica_set2.conf

mongod --config /home/movedev/mongo/etc/replica_set3.conf
