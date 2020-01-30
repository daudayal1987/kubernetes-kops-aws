#/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;

command="AWS_PROFILE=$AWS_PROFILE_NAME kops create cluster --name $CLUSTER_NAME --state $CLUSTER_STATE_STORE --ssh-public-key $CLUSTER_SSH_PUBLIC_KEY --cloud aws"; 

if [ ! -z ${CLUSTER_MASTER_COUNT+x} ]; then
	command="$command --master-count $CLUSTER_MASTER_COUNT"; 
fi

if [ ! -z ${CLUSTER_MASTER_ZONES+x} ]; then
	command="$command --master-zones $CLUSTER_MASTER_ZONES";
fi

if [ ! -z ${CLUSTER_MASTER_SIZE+x} ]; then
        command="$command --master-size $CLUSTER_MASTER_SIZE";
fi

if [ ! -z ${CLUSTER_NODE_COUNT+x} ]; then
        command="$command --node-count $CLUSTER_NODE_COUNT";
fi

if [ ! -z ${CLUSTER_NODE_ZONES+x} ]; then
        command="$command --zones $CLUSTER_NODE_ZONES";
fi

if [ ! -z ${CLUSTER_NODE_SIZE+x} ]; then
        command="$command --node-size $CLUSTER_NODE_SIZE";
fi


eval $command;

AWS_PROFILE=$AWS_PROFILE_NAME kops update cluster $CLUSTER_NAME --state $CLUSTER_STATE_STORE --yes
