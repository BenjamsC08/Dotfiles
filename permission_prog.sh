#!/bin/bash

# in /etc/fstab : UUID=123e4567-e89b-12d3-a456-426614174000  /mnt/Prog  ext4  defaults  0  2


MOUNT_POINT="/mnt/Prog"
GROUP="users"

# Changer le propriétaire et le groupe
sudo chown -R root:$GROUP $MOUNT_POINT

# Changer les permissions
sudo chmod -R 775 $MOUNT_POINT

# Remonter la partition
sudo umount $MOUNT_POINT
sudo mount -a

