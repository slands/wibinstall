#!/bin/bash
set -e

    lb config --architecture i386 \
          --linux-flavours 586 \
          --memtest none \
          --bootappend-live "boot=live config hostname=wibinstall"

exec "$@"
