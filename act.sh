#!/bin/bash 
set -e
source <(curl -sSL benco.io/lib) # Load libary from remote URL, it's safe!

GITHUB="nektos/act"
VERSION=${1:-"$(get_latest_release $GITHUB)"}
INSTALL_DIR=${2:-"/bin"}
CMD=act
NAME="Nektos Act"

pre_run

curl -sSL https://github.com/$GITHUB/releases/download/v"${VERSION}"/act_Linux_x86_64.tar.gz | \
     tar -zx -C "$INSTALL_DIR" $CMD

echo $INSTALL_DIR

post_run
