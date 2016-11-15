#!/bin/bash

#RUN_THIN="bundle exec thin -p 5000 start"
RUN_THIN="bundle exec shotgun --server=thin --port=5000"
SEARCH_THIN_PROCESS="ps uax | grep thin"

#export SRM_API_GATEKEEPER_CLIENT_ID="c5dc5f6d3b6a4ecdedaea6cf3af60373207f8dfb4a3774ccb78b89577d55ea0d"
#export SRM_API_GATEKEEPER_SECRET_KEY="8428b94f72f91bec53addf1c166dd9cc8560692e9ea4ee7ca9c642b00c61e73d"
#export SRM_API_OAUTH_URL="http://localhost:4002/"
#export SRM_API_TOKEN_SCOPE="internal"
#export SRM_API_REDIS_HOST="localhost"
#export SRM_API_REDIS_DB="8"


# Engage client env vars
export ENGAGE_URL="http://localhost:3000"
#export ENGAGE_URL="https://staging-ucf.involver.com"
export ENGAGE_API_KEY="82933467-832d-5e61-eq8r-f1543a65cf40"

#export METADATA_CATALOG_CLIENT_KEY="SuperLongUnbreakableKey"
#export METADATA_CATALOG_BASE_URL="http://localhost:5001"

if [ "$1" == '-f' ]; then
  echo "Running thin in foreground"
  $RUN_THIN
else
  echo "Don't forget to kill it if you want to stop it: \`$SEARCH_THIN_PROCESS\`"
  $RUN_THIN &
fi
