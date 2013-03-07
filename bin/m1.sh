#! /bin/bash

# mongod --config /etc/mongodb.conf
# mongod -f /etc/mongodb.conf

if [ "$#" -eq 0 ]; then
	echo "Please input dirname";
fi

if [ "$#" -eq 1 ]; then
	echo "Bingo"
fi


mongo <<EOF

use test
db.tpousers.find().pretty()
db.tpousers.find({user: 'william111'}).pretty()

EOF


# pkill is better, and kill -2 or -15?
ps -ef | grep mongod |grep -v grep | awk '{print $2}' | while read pid 
do 
  kill -15 $pid
done
#! /bin/bash

# mongo test --eval "printjson(db.getCollectionNames())"


if [ "$#" -eq 0 ]; then
  echo "Please input dirname";
  exit 1;
fi


cd $HOME

if [ -d "$DIR" ]; then
	mkdir -p 
fi


echo "Now Restart Daemon process: "
for i in `ls mongod.sh`
do
  ps -ef | grep $i | grep -v grep >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "$i is already running."
    else
      ${DDIR}$i
      echo "$i NOW is starting running..."
  fi
done

