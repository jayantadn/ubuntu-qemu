#!/bin/sh

# create bridge
sudo ip link add name br0 type bridge
sudo ip addr add 192.168.100.1/24 dev br0
sudo ip link set dev br0 up

# create tap devices owned by your user (so you can run qemu as your user)
sudo ip tuntap add dev tap0 mode tap user "$(whoami)"
sudo ip tuntap add dev tap1 mode tap user "$(whoami)"

# attach taps to bridge
sudo ip link set dev tap0 master br0
sudo ip link set dev tap1 master br0

# bring taps up
sudo ip link set dev tap0 up
sudo ip link set dev tap1 up

# let guest vms use host network for internet connection
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -s 192.168.100.0/24 ! -o br0 -j MASQUERADE
