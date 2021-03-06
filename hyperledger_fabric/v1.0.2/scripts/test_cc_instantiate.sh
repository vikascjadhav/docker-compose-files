#!/bin/bash

# Importing useful functions for cc testing
if [ -f ./func.sh ]; then
 source ./func.sh
elif [ -f scripts/func.sh ]; then
 source scripts/func.sh
fi

# Instantiate chaincode on all peers
# Instantiate can only be executed once on any node
echo_b "Instantiating chaincode on channel ${APP_CHANNEL} (once for each channel is enough, we make it concurrent here)..."
chaincodeInstantiate "${APP_CHANNEL}" 1 0 ${CC_02_NAME} ${CC_INIT_VERSION} ${CC_02_INIT_ARGS}
chaincodeInstantiate "${APP_CHANNEL}" 2 0 ${CC_02_NAME} ${CC_INIT_VERSION} ${CC_02_INIT_ARGS}

echo_g "=== Instantiate chaincode done ==="
