#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure
set interfaces ethernet eth0 address 10.10.0.1/24
set interfaces ethernet eth1 address 30.30.0.1/16
set interfaces ethernet eth2 address 20.20.0.1/20
set interfaces ethernet eth3 address 1.0.0.1/8


set protocols static route 50.50.0.0/25 next-hop 20.20.0.3
set protocols static route 2.0.0.0/8 next-hop 20.20.0.3
set protocols static route 10.0.10.0/24 next-hop 30.30.0.2

commit

