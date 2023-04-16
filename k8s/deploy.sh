kubectl delete -f busybox-job.yaml
kubectl apply -f namespace.yaml
kubectl apply -f ingress.yaml
kubectl apply -f nginx.yaml
kubectl apply -f busybox-job.yaml