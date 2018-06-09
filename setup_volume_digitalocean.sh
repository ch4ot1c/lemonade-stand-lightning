#!/bin/bash

## BE CAREFUL WITH THIS SCRIPT!
## IT DELETES / FORMATS + MOUNTS THE CONTENTS OF THE NAMED VOLUME!

sudo mkfs.ext4 -F /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01

mkdir -p /mnt/volume-nyc1-01
mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01
echo /dev/disk/by-id/scsi-0DO_Volume_volume-nyc1-01 /mnt/volume-nyc1-01 ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab

# Volume now available at directory: /mnt/volume-nyc1-01

reboot