#!/bin/bash

# Add local user

USER_ID=${UID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user

/deepsimulator/DeepSimulator/deep_simulator.sh "$@"

chown user:user -R /deepsimulator/data

