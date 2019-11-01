# CentOS network-scripts example
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

