#!/bin/bash
echo "sleeping for 10 seconds"
sleep 10

echo mongo_setup.sh time now: `date +"%T" `
mongo --host mongo1.testing.sabay.com:27017 <<EOF
  var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "mongo1.testing.sabay.com:27017",
        "priority": 1
      },
      {
        "_id": 1,
        "host": "mongo2.testing.sabay.com:27017",
        "priority": 0.5
      },
      {
        "_id": 2,
        "host": "mongo3.testing.sabay.com:27017",
        "priority": 0.5
      }
    ]
  };
  rs.initiate(cfg);
EOF

mongo --host mongo2.testing.sabay.com:27017 <<EOF
  rs.slaveOk();
EOF

mongo --host mongo3.testing.sabay.com:27017 <<EOF
  rs.slaveOk();
EOF
