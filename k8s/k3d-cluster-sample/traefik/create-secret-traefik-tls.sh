# 개인키 및 CSR 생성 (CN, OU, O, C 포함)
openssl req -newkey rsa:4096 -nodes -keyout hgcho.key \
  -subj "/C=KR/O=Hgcho/OU=Hgcho Machine/CN=hgcho.test" -out hgcho.csr

# SAN(DNS 이름) 설정 파일 작성
cat > hgcho.ext <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = hgcho.test
DNS.2 = *.hgcho.test
EOF

# 인증서 발급 (Self-signed)
openssl x509 -req -in hgcho.csr -signkey hgcho.key -out hgcho.crt -days 365 -extfile hgcho.ext

# 발급한 인증서를 사용해 echo-app namespace에 Secret으로 등록
kubectl delete secret hgcho-test-tls-secret
sleep 1
kubectl create secret tls hgcho-test-tls-secret --cert=hgcho.crt --key=hgcho.key
sleep 1

# 확인
kubectl get secrets -o wide

# cleanup certs files
rm -f ./hgcho.ext ./hgcho.csr ./hgcho.key ./hgcho.crt

