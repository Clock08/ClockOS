#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/clockos.kernel isodir/boot/clockos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "clockos" {
    multiboot /boot/clockos.kernel
}
EOF
grub-mkrescue -o clockos.iso isodir
