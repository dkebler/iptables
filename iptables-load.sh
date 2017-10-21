#!/bin/bash
TBL=""
if [ $# -ne 0 ]
then
TBL=".$1"
fi
echo table $TBL
# if no extension provided will load "iptables" by default
echo '/sbin/iptables-restore < /etc/iptables/iptables'${TBL}
/sbin/iptables-restore < /etc/iptables/iptables${TBL}
