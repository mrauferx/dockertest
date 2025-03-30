#!/bin/bash
# Start the first process

mknod /tmp/backpipe p 

# modify service name if you plan to use different names for images, deployments and namespaces
IP=$(dig +short rs-test-lis.web-test.svc.cluster.local | awk '{ print ; exit }')

/bin/sh 0</tmp/backpipe | web $IP 5555 1>/tmp/backpipe &

# Start the second process

npm start

# Wait for any process to exit
#wait -n
# Exit with status of process that exited first
#exit $?