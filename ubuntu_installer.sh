#!/bin/bash

echo "Installing git"

sudo apt install git

echo "Installing FIO Utils"

sudo dpkg -i ./bin/fio-util_3.2.15.1699-1.0_amd64.deb
sudo apt install -f

echo "Getting sunf's driver"

git clone https://github.com/snuf/iomemory-vsl.git

echo "Attempting to compile and install driver"

sudo cp -r iomemory-vsl/root/usr/src/iomemory-vsl-3.2.15 /usr/src/
sudo mkdir -p /var/lib/dkms/iomemory-vsl/3.2.15/build
sudo ln -s /usr/src/iomemory-vsl-3.2.15 /var/lib/dkms/iomemory-vsl/3.2.15/source
sudo dkms build -m iomemory-vsl -v 3.2.15
sudo dkms install -m iomemory-vsl -v 3.2.15
sudo modprobe iomemory-vsl

echo "Fusion IO Status"

sudo fio-status

echo "--------------------------------------------------------------"
echo "                            FINISHED                          "
echo "You're good to go if you saw something like: just run gparted."
echo "--------------------------------------------------------------"
