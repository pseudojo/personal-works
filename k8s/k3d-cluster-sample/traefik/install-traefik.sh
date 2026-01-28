
# create tls secret
bash ./create-secret-traefik-tls.sh 

sleep 5

# install traefik
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik -f ./values-traefik.yaml --wait

sleep 5

# check traefik charts
helm list -A | grep traefik

# install traefik dashboard httproute - "https://dashboard.hgcho.test/dashboard/"
kubectl apply -f ./traefik-httproute-443-https.yaml


