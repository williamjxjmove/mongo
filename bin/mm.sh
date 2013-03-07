#! /bin/bash

# wjiang02vv.corp.homestore.net, loclahost, or read from config file?
# port number dynamic assign?

mongo localhost:29101 <<EOF

rs.status()
rs.initiate()
rs.conf()
rs.add('localhost:29102')
rs.add('localhost:29103')

EOF

mongo localhost:29102 <<EOF

rs.initiate()
rs.conf()
rs.slaveOk()

EOF
