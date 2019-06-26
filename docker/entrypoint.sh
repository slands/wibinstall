#!/bin/bash
set -e

    lb config --architecture i386 \
          --linux-flavours 586 \
          --memtest none \
          --bootappend-live "boot=live config hostname=wibinstall"

echo "dosfstools" > config/package-lists/dosfstools.list.chroot

mkdir -p config/includes.chroot/sbin
mkdir -p config/includes.chroot/azotel/src
mkdir -p config/includes.chroot/azotel/img

chmod 777 config/includes.chroot/sbin
chmod 777 config/includes.chroot/azotel/{src,img}

exec "$@"
