#!/bin/sh

qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -cpu host \
  -drive file=noble-server-cloudimg-amd64.img,format=qcow2,if=virtio \
  -cdrom seed.img \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=net0 \
  -nographic
