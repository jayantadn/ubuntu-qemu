#!/bin/sh

qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -cpu host \
  -drive file=$(pwd)/vm2.qcow2,if=virtio,format=qcow2 \
  -cdrom $(pwd)/seed-vm2.iso \
  -netdev tap,id=net0,ifname=tap1,script=no,downscript=no \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:12:00:02 \
  -virtfs local,id=hostshare,path=qemu_share,security_model=none,mount_tag=hostshare \
  -nographic
