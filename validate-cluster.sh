#/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;

AWS_PROFILE=$AWS_PROFILE_NAME kops validate cluster --state=$CLUSTER_STATE_STORE
