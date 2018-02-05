#!/bin/bash
set -e
cd /root/eth-net-intelligence-api
NAME="GUEST_$(hostname)"
BOOTSTRAP_IP="23.24.168.98"
perl -pi -e "s/XXX/$NAME/g" app.json
perl -pi -e "s/REMOTE/$BOOTSTRAP_IP/g" app.json
perl -pi -e "s/REMOTE/$BOOTSTRAP_IP/g" /root/.ethereum/devchain/static-nodes.json
/usr/bin/pm2 start ./app.json
sleep 3
geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"
sleep 3
GETH_OPTS="${@/XXX/$BOOTSTRAP_IP}"
geth $GETH_OPTS
