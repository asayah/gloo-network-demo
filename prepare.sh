kind create cluster --config=kind.yaml

#cilium
helm repo add cilium https://helm.cilium.io/
docker pull quay.io/cilium/cilium:v1.13.6
kind load docker-image quay.io/cilium/cilium:v1.13.6

helm install cilium cilium/cilium --version 1.13.6 \
   --namespace kube-system \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes \
   --set hubble.relay.enabled=true \
   --set hubble.ui.enabled=true

#Demo app 

kubectl create ns client
kubectl apply -f https://raw.githubusercontent.com/istio/istio/master/samples/sleep/sleep.yaml -n client


# Bookinfo Team
kubectl create ns bookinfo
kubectl -n bookinfo apply -f https://raw.githubusercontent.com/istio/istio/1.18.2/samples/bookinfo/platform/kube/bookinfo.yaml