#! /bin/bash -e


cd /Users/cpandey/dev/projects/Docker-Kube-Projects/itlogiclabs-restaurant-parent/deployment/scripts


sleep 4;

kubectl apply -f ../kubernetes/statefulsets/mysql-order-deployment-definition.yaml

./wait-for-pod.sh mysql

kubectl get all

echo "......................................................."
echo "MYSQL Deployment is completed fir order; sleeping for 4 sec"
sleep 4;

kubectl apply -f ../kubernetes/order/order-deployment-definition.yaml
./wait-for-pod.sh order

kubectl get all


echo "......................................................."
echo "Order Deployment completed"
sleep 4;
