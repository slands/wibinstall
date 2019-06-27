#!/bin/bash
set -e

    lb config --architecture i386 \
          --linux-flavours 586 \
          --memtest none \
          --bootappend-live "boot=live config username=root hostname=wibinstall"

echo "dosfstools" > config/package-lists/dosfstools.list.chroot

mkdir -p config/includes.chroot/sbin
mkdir -p config/includes.chroot/azotel/src
mkdir -p config/includes.chroot/azotel/img

chmod 777 config/includes.chroot/sbin
chmod 777 config/includes.chroot/azotel/{src,img}

mkdir -p config/includes.chroot/lib/systemd/system/
cp /docker/getty@.service config/includes.chroot/lib/systemd/system/
chown root.root config/includes.chroot/lib/systemd/system/getty@.service

exec "$@"
