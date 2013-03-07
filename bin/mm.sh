#! /bin/bash

mongo localhost:29101 <<EOF

rs.status()
rs.initiate()
rs.conf()
rs.add('wjiang02vv.corp.homestore.net:29102')
rs.add('wjiang02vv.corp.homestore.net:29103')

EOF

