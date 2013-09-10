#!/bin/bash

# This script will create symlinks to fasten PXE load.

cd ..

# delete (--clear) parameter
if [ "$1" == "--clear" ]; then
    rm  -f ldlinux.c32 libcom32.c32 libutil.c32
    cd pxelinux.cfg
    rm -f 0A 0A0 0A00 0A000 0A0000 
    rm -f C0 C0A C0A8 C0A80 C0A800
    echo "Symlinks deleted.";
    exit
fi



function ln_boot() {
    ln -s boot/isolinux/$1 ./$1
}

function ln_pxe() {
    ln -s default ./$1
}

# create root links to .c32 files. 
# syslinux will find them here sooner
ln_boot ldlinux.c32
ln_boot libcom32.c32
ln_boot libutil.c32

# create common subnets loaders in pxelinux.cfg. 
# syslinux will find them here sooner
cd pxelinux.cfg
ln_pxe 0A
ln_pxe 0A0
ln_pxe 0A00
ln_pxe 0A000
ln_pxe 0A0000
ln_pxe C0
ln_pxe C0A
ln_pxe C0A8
ln_pxe C0A80
ln_pxe C0A800

echo Done.