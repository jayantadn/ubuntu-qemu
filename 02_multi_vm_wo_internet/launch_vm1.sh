#!/bin/sh

qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -cpu host \
  -drive file=$(pwd)/vm1.qcow2,if=virtio,format=qcow2 \
  -cdrom $(pwd)/seed-vm1.iso \
  -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:12:00:01 \
  -virtfs local,id=hostshare,path=qemu_share,security_model=none,mount_tag=hostshare \
  -nographic
