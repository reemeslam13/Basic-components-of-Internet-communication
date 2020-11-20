#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure
ip addr add 10.10.0.1/24 brd + dev eth0
ip addr add 30.30.0.1/16 brd + dev eth1
ip addr add 20.20.0.1/20 brd + dev eth2
ip addr add 1.0.0.1/8 brd + dev eth3
ip route add 40.40.0.0/24 via 30.30.0.2
ip route add 50.50.0.0/25 via 20.20.0.3
ip route add 2.0.0.0/8 via 20.20.0.3

commit

