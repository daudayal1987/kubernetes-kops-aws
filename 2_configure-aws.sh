#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )";
source $SCRIPT_PATH/.env;

aws configure set profile.$AWS_PROFILE_NAME.aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set profile.$AWS_PROFILE_NAME.aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set profile.$AWS_PROFILE_NAME.region $AWS_REGION
aws configure set profile.$AWS_PROFILE_NAME.output json
