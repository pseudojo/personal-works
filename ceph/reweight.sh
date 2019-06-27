#!/bin/bash

# # 1 for all
# for n in `/bin/ceph osd df | egrep -v 'VAR|TOTAL' | sort -nk1 | awk '{print $1}'`; do
#   ceph osd reweight osd.$n 1 & 
# done

#wait 

/bin/ceph osd reweight-by-utilization 101 1 48
