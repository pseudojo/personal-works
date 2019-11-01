# CentOS network-scripts example

```
# 이더넷 인터페이스 작동여부 확인
ethtool eno1
ethtool bond0

# bonding 내용 확인
cat /proc/net/bonding/bond0
# [user@develop-net1 ~]$ cat /proc/net/bonding/bond0
# Ethernet Channel Bonding Driver: v3.7.1 (April 27, 2011)
# 
# Bonding Mode: fault-tolerance (active-backup)
# Primary Slave: eno1 (primary_reselect always)
# Currently Active Slave: eno1
# MII Status: up
# MII Polling Interval (ms): 100
# Up Delay (ms): 0
# Down Delay (ms): 0
# 
# Slave Interface: eno1
# MII Status: up
# Speed: 10000 Mbps
# Duplex: full
# Link Failure Count: 0
# Permanent HW addr: xx:xx:xx:xx:xx:xx
# Slave queue ID: 0

```

---

```
# bonding을 할 경우 확인
## bonding 모듈 삽입
modprobe bonding

## bonding 모듈 확인
lsmod | grep bonding

# VLAN을 적용할 경우 확인
## VLAN Tagging 모듈 삽입
modprobe 8021q

## vlan 모듈 확인
lsmod | grep 8021q

###############################

# network 재시작 전 ip 명령어로 작동여부 확인 (NetworkManager가 정지된 상태일 때 하는 것을 추천)
ip down bond0 eno1 eno2
ip up eno1 eno2
ip up bond0

ip addr | grep state\ UP


# network 재시작 : (NetworkManager 정지 ->) network 정지 -> network 시작 (-> NetworkManager 시작)
# NetworkManager를 사용할 경우 NetworkManager를 먼저 정지시킨 후
# network-scripts를 모두 수정하고 나서 재시작할 것.
systemctl stop NetworkManager
systemctl stop network
systemctl start network
systemctl start NetworkManager


# 통신 여부 확인
GATEWAY="$( ip route | grep default\ via | awk '{print $3}' )"
ping $GATEWAY -c 1

```

