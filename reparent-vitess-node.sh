#!/bin/bash

# Set target host master IP 
TARGET_HOST='192.168.4.100'


count=$(ping -c 3 $TARGET_HOST | grep from* | wc -l)

if [ $count -eq 0 ]; then
    echo "$(date)" "Target host" $TARGET_HOST "unreachable, Rebooting!" >>/var/log/dbrep.log
    /usr/local/vitess/bin/vtctlclient --server $localhost:15999 TabletExternallyReparented zone1-410 # replication sql


else
    /usr/local/vitess/bin/vtctlclient --server $localhost:15999 TabletExternallyReparented zone1-409 # master replication sql
    echo "$(date) ===-> Back To Master Node Success " >>/var/log/dbrep.log
fi
