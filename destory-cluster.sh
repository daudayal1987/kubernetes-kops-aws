#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;

export AWS_PROFILE=$AWS_PROFILE_NAME
AWS_PROFILE=$AWS_PROFILE_NAME kops delete cluster --yes --name=$CLUSTER_NAME --state=$CLUSTER_STATE_STORE
