#!/bin/bash

# VARIABLES
DEPLOYMENT_NAME="shared-redis-test"
BOSH_NAME="boshd"       # bosh env bosh Name

# DEPLOY
bosh -e ${BOSH_NAME} -d ${DEPLOYMENT_NAME} deploy --no-redact deployment.yml \
    -l vars.yml \
    -v deployment_name=${DEPLOYMENT_NAME}
