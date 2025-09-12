# ubuntu-qemu
A ready-to use qemu image for ubuntu-cloud

# How to use
1. If `noble-base.qcow2` is not present, run `join_image.sh`
1. create bridge and tap using `create_bridge_and_tap.sh`.
Hint. if bridge and tap was created before, restart the host machine.
1. launch vms using `launch_vm1/2.sh`
1. pint one vm from the other using each ip address
1. from one vm launch z_sub and from another z_pub
