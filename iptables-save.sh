#!/bin/bash
TBL=""
if [ $# -ne 0 ]
then
TBL=".$1"
fi
echo saving /etc/iptables/iptables$TBL
iptables-save > /etc/iptables/iptables$TBL
