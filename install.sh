CLUSTER_NAME=mgmt
GLOO_VERSION=2.4.1
GN_LICENCE=eyJhZGRPbnMiOltdLCJleHAiOjE3MDA5MzkxMDEsImlhdCI6MTY5NTc1MTUwMSwiayI6IldjQjRFdyIsImx0IjoidHJpYWwiLCJwcm9kdWN0IjoiZ2xvby1uZXR3b3JrIn0.C-0UHIvKe70YLfYaF5XX8HWZOnOexQMZlYlOrgCuzt0

meshctl install --profiles gloo-mesh-single,gloo-network \
  --set common.cluster=$CLUSTER_NAME \
  --set istioInstallations.enabled=false \
  --set glooMgmtServer.createGlobalWorkspace=false \
  --version $GLOO_VERSION \
  --set licensing.glooNetworkLicenseKey=$GN_LICENCE

  