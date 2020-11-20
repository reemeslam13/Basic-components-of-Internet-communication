#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure
ip addr add 30.30.0.2/16 brd + dev eth0
ip addr add 40.40.0.2/24 brd + dev eth1
ip route add 10.10.0.0/24 via 30.30.0.1
ip route add 50.50.0.0/25 via 30.30.0.1
ip route add 2.0.0.0/8 via 30.30.0.1
ip route add 1.0.0.0/8 via 30.30.0.1

commit
