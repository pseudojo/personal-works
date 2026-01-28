# 1. k3d 클러스터 생성
### subnet : 172.18.0.0/16
### 80, 443 : load balancer, but disable bundle traefik - manual install traefik.
### nodes : 5ea(server(s) 1, agent(s) 4)
### cluster cidr : 10.12.0.0/17
### service cidr : 10.12.128.0/17
### k3s image : rancher/k3s:v1.35.0-k3s1 (2026/01/26 latest)

# 명령어가 아닌 config yaml 파일을 이용해서 업데이트하는 것도 가능하다.
k3d cluster create --config k3d-config-v1alpha5.yaml

