#!/bin/bash

PWD=$( cd `dirname $0` && pwd -P )
touch $PWD/prodrepo-pf.pid

OLD_PID=$( cat $PWD/prodrepo-pf.pid )
if [ "x$OLD_PID" == "x" ]; then
  OLD_PID=$( ps -ef | egrep "ssh -N.*@prodrepo$" | awk '{print $2}' )
fi

if [ "x$OLD_PID" == "x" ]; then
  echo "Can't port forwarding ssh process."
  exit 1
fi

echo "PID : [$OLD_PID]"

echo "Stop prodrepo port forwarding."
sudo kill $OLD_PID
sleep 1

# check to stop proces
PCHK=$( ps -ef | grep $OLD_PID | grep -v grep )
if [ "x$PCHK" != "x" ]; then
  sudo kill -9 $OLD_PID
fi

echo "" > $PWD/prodrepo-pf.pid

echo "Done to stop prodrepo port forwarding."

