#!/bin/bash

CPUS=$(nproc)

exit

echo "Installing git dependancies"

sudo apt install -y git aufs-tools

echo "Installing FIO Utils"

sudo dpkg -i ./bin/fio-util_3.2.15.1699-1.0_amd64.deb
sudo apt install -f

echo "Getting sunf's driver"

git clone https://github.com/RemixVSL/iomemory-vsl.git

echo "Attempting to compile and install driver"

cd iomemory-vsl
git fetch --all --tags
git checkout v5.12.1
make module
sudo insmod root/usr/src/iomemory-vsl-3.2.16/iomemory-vsl.ko


echo "Fusion IO Status"

sudo fio-status

echo "--------------------------------------------------------------"
echo "                            FINISHED                          "
echo "You're good to go if you saw something like: just run gparted."
echo "--------------------------------------------------------------"
