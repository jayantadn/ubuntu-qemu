#!/bin/sh

BASE=noble-base.qcow2

# create two writable overlays
qemu-img create -f qcow2 -F qcow2 -b "$BASE" ../vm1.qcow2
qemu-img create -f qcow2 -F qcow2 -b "$BASE" ../vm2.qcow2
