#!/bin/bash

MOUNT_POINT="/mnt/Prog"
GROUP="users"

# Changer le propriétaire et le groupe
sudo chown -R root:$GROUP $MOUNT_POINT

# Changer les permissions
sudo chmod -R 775 $MOUNT_POINT

# Remonter la partition
sudo umount $MOUNT_POINT
sudo mount -a

