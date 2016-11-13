#!/usr/bin/env bash

sed -i -e 's/gen=1/gen=0/g' /root/.zcash/zcash.conf
zcash-cli stop
sleep 2
apt-get update && apt-get upgrade -yq
zcashd --daemon
