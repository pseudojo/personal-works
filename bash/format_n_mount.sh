#!/bin/bash

FILE=.mount_run.sh
rm -f $FILE

#DEV_LIST=( `fdisk -l | grep -v 'sda' | grep 480.1 | tr -d '\:' | awk '{print $2}' | sort` )
fdisk -l | grep -v 'sda' | grep 480.1 | tr -d '\:' | sort | awk '{print "parted -s "$2" mklabel gpt"}' >> $FILE
fdisk -l | grep -v 'sda' | grep 480.1 | tr -d '\:' | sort | awk '{print "parted -s "$2" mkpart primary 0% 100%"}' >> $FILE
fdisk -l | grep -v 'sda' | grep 480.1 | tr -d '\:' | sort | awk '{print "sleep 0.1 && mkfs.ext4 "$2"1 &>> format.log &"}' >> $FILE

echo 'FAIL=0
for job in `jobs -p`
do
    #echo $job
    wait $job || let "FAIL+=1"
done

echo $FAIL

if [ "$FAIL" == "0" ];
then
echo "Done formatting."
else
echo "FAIL! ($FAIL)"
fi
' >> $FILE

chmod +x $FILE && ./$FILE

# /dev/sdt1 UUID 51455ef4-d617-4fe5-b9f1-9564becc01a0 TYPE ext4 PARTLABEL primary PARTUUID c058ba73-14d0-42db-a31c-17c7ef9c4a53
echo "Set /etc/fstab"
echo " " >> /etc/fstab
echo "# SSD mount" >> /etc/fstab
UUIDS=( `blkid | grep '/dev/sd' | grep -v sda | grep ext4 | grep primary | sort | tr -s '\:="' ' ' | awk '{print $3}'` )
NUM=0
for UUID in ${UUIDS[@]}; do
    NUM=$((NUM+1))
    MOUNT="/ssd_`printf '%02d' ${NUM}`"
    echo "UUID=${UUID} $MOUNT        ext4    defaults        0 0" >> /etc/fstab
done
echo "# Done." >> /etc/fstab

rm -f $FILE
#echo "Remove temporary file."

echo "Done."
