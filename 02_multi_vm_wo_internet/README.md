# ubuntu-qemu
A ready-to use qemu image for ubuntu-cloud

# pre-requisites

## qemu installation
`sudo apt install qemu-system qemu-utils qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager -y`

# how to use
1. If `noble-base.qcow2` is not present, run `./join_image.sh`
1. create bridge and tap using `./create_bridge_and_tap.sh`.
Hint. if bridge and tap was created before, restart the host machine.
1. launch vms using `./launch_vm1.sh` and `./launch_vm2.sh` in separate terminals
1. login credentials `ubuntu`
1. check ip address using `ip a`
1. ping one vm from the other using each ip address

# transfering files to guest
1. create a folder called `qemu_share` and put all files to ship to guest

# internet connection in guest
todo

# zenoh testing
1. from one vm launch z_sub and from another z_pub
