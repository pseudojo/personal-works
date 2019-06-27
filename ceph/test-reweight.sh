#!/bin/bash

echo "Big disk : 9, 10, 11, 56, 57, 58"
echo "--------------------------------"
#/bin/ceph osd test-reweight-by-utilization 101 1 48 --no-increasing
/bin/ceph osd test-reweight-by-utilization 101 1 1000
