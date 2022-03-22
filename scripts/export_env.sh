#!/bin/sh
# Call `source ./scripts/export_env.sh` to execute

# export the environment variables
export $(grep -v '^#' ./local.keys | sed 's/#.*//')

export MATCH_GIT_BASIC_AUTHORIZATION=$(echo -n diaojiagou:$GITHUB_API_TOKEN | base64)

#export MATCH_PASSWORD=$(echo -n $MATCH_PASSWORD | base64)