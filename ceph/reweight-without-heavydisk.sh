#!/bin/bash

# # 1 for all
# for n in `/bin/ceph osd df | egrep -v 'VAR|TOTAL' | sort -nk1 | awk '{print $1}'`; do
#   ceph osd reweight osd.$n 1 & 
# done

OPTS=""
#OPTS="--no-increasing"

WITHOUT_HEAVY=""
#WITHOUT_HEAVY=" | egrep -v 'd.9|d.10|d.11|d.56|d.57|d.58'"

# $1 -> osd.{id}
# $3 -> reweight float at now
# $5 -> reweight float at future
ceph osd test-reweight-by-utilization 101 1 48 $OPTS 2>/dev/null $WITHOUT_HEAVY | grep osd | grep weight | awk '{print $1" "$5}' > .temp.list


# * current
exec < .temp.list
while read line; do
  ceph osd reweight $line &
done

wait 

rm .temp.list
