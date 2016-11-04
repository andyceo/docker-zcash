#!/usr/bin/env bash

sed -i -e 's/gen=0/gen=1/g' /root/.zcash/zcash.conf
zcash-cli stop
sleep 2
zcashd --daemon
