kubectl delete -f $PWD/ingress-jenkins.yaml
kubectl delete -f $PWD/service.yaml
kubectl delete -f $PWD/deployment.yaml
kubectl delete -f $PWD/volume.yaml
kubectl delete -f $PWD/serviceAccount.yaml