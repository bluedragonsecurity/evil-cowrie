#!/bin/bash
sudo iptables -t nat -F
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j DNAT --to-destination 0.0.0.0:2222
sudo iptables -t nat -A OUTPUT -p tcp --dport 22 -m owner --uid-owner root -j ACCEPT
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
sudo iptables -t nat -A OUTPUT -p tcp --dport 22 -m owner --uid-owner root -j ACCEPT
sudo echo 1 > /proc/sys/net/ipv4/ip_forward
