#!/bin/sh
set -e

echo "Activating feature 'octez-client'"


# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

apt-get update -y 
apt-get install software-properties-common -y
REPO="ppa:serokell/tezos"
add-apt-repository -y $REPO && sudo apt-get update
apt-get install -y tezos-client
# sudo apt-get install -y tezos-node