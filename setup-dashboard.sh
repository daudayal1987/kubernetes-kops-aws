#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;


#apply dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc3/aio/deploy/recommended.yaml
kubectl apply -f dashboard-admin-service-account.yaml
kubectl apply -f dashboard-cluster-role-binding.yaml


echo ""
echo "Dashboard Url: ";
echo $(kubectl config view -o jsonpath="{.clusters[?(@.name==\"$CLUSTER_NAME\")].cluster.server}{\"\n\"}")/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

echo ""
echo "Basic auth credentials:"
echo "Username = "$(kubectl config view -o jsonpath="{.users[?(@.name==\"${CLUSTER_NAME}-basic-auth\")].user.username}{\"\n\"}")
echo "Password = "$(kubectl config view -o jsonpath="{.users[?(@.name==\"$CLUSTER_NAME-basic-auth\")].user.password}{\"\n\"}")

echo ""
echo "Bearer Token: "
echo $(kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') | grep token: | awk '{print $2}')

echo ""
