#!/bin/bash
TBL=""
if [ $# -ne 0 ]
then
TBL=".$1"
echo persisting by copying iptables$TBL to iptables
cp /etc/iptables/iptables${TBL} /etc/iptables/iptables
/sbin/iptables-restore < /etc/iptables/iptables
echo "***************** Iptable Persisted **************"
iptables-save | more
else
echo "need to specify table <name> to persist iptables.<name>"
fi
