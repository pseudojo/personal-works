# 2. linkerd 설치 : Linkerd CLI 다운로드 및 설치
curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh

# 경로 설정 (셸 설정 파일에 추가하면 더 좋습니다)
export PATH=$PATH:$HOME/.linkerd2/bin

# 설치 확인
linkerd version

# Linkerd 설치 전 클러스터 준비 확인
linkerd check --pre

# 컨트롤 플레인 설치 (생성된 매니페스트를 클러스터에 바로 적용)
linkerd install --crds| kubectl apply -f -
linkerd install | kubectl apply -f -
linkerd upgrade --crds | kubectl apply -f -
linkerd upgrade | kubectl apply -f -
# --set 플래그를 사용하여 프록시 인젝터의 기본값을 true로 설정: traffic 추적을 클러스터 전체에 기본적으로 활성화하고 싶을 때 이 옵션을 사용
linkerd upgrade --set proxyInjector.enableDefault=true | kubectl apply -f -

# 설치가 완료될 때까지 대기 (모든 구성 요소가 실행 중이어야 합니다)
linkerd check

# Viz 확장 기능 설치 및 대시보드 확인 📊

## 시각화(Viz) 확장 설치
linkerd viz install | kubectl apply -f -

## 설치 확인
linkerd viz check

# 로컬 브라우저에서 대시보드 열기
linkerd viz dashboard &

#############

# 노드 이름과 라벨(team) 확인
kubectl get nodes --show-labels | grep team

