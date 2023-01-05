kubectl apply -f $PWD/serviceAccount.yaml
kubectl create -f $PWD/volume.yaml
kubectl apply -f $PWD/deployment.yaml
kubectl apply -f $PWD/service.yaml
kubectl apply -f $PWD/ingress-jenkins.yaml