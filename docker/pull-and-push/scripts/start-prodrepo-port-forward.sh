#!/bin/bash

ssh -N -4L15000:localhost:5000 centos@prodrepo &
#ssh -N -4L4567:localhost:4567 centos@buildrepo &
PID="$!"
echo "$PID" > prodrepo-pf.pid;

