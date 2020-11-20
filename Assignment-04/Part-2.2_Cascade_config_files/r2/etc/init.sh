#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure
#ip addr add 30.30.0.2/16 brd + dev eth0
set interfaces ethernet eth0 address 30.30.0.2/16
set interfaces ethernet eth1 address 40.40.0.2/24
set interfaces ethernet eth2 address 10.0.10.2/24
#ip addr add 40.40.0.2/24 brd + dev eth1
#ip addr add 10.0.10.2/24 brd + dev eth2

#ip route add 10.10.0.0/24 via 30.30.0.1
set protocols static route 10.10.0.0/24 next-hop 30.30.0.1
set protocols static route 1.0.0.0/8 next-hop 30.30.0.1

#ip route add 50.50.0.0/25 via 30.30.0.1
#ip route add 2.0.0.0/8 via 30.30.0.1
#ip route add 1.0.0.0/8 via 30.30.0.1

set nat source rule 10 outbound-interface eth0

set nat source rule 10  source address 40.40.0.0/24
set nat source rule 10 translation address masquerade 

set nat destination rule 100 inbound-interface eth0
set nat destination rule 100 destination port 443
set nat destination rule 100 translation address 40.40.0.99
set nat destination rule 100 protocol tcp

ip route add 40.40.0.0/24 via 30.30.0.1

commit
