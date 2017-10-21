#!/bin/bash
source /etc/iptables/iptables-flush.sh
# https://serverfault.com/questions/453254/routing-between-two-networks-on-linux
# Always accept loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# We allow all traffic from the LAN side
iptables -A INPUT -i lan -j ACCEPT

######################################################################
#
#                         ROUTING
#
######################################################################

iptables -A INPUT -p tcp -m multiport --dports 6450 -j ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# fowarding already established connections
iptables -A FORWARD -i wan -o lan -m state --state RELATED,ESTABLISHED -j ACCEPT
# Allow outgoing connections from the LAN side.
iptables -A FORWARD -i lan -o wan -j ACCEPT

######################################################################
#
#                        NAT
#
######################################################################
# Let LAN use wan DNS servers.
iptables -t nat -A POSTROUTING -o wan -j MASQUERADE
