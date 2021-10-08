#!/bin/bash
# install Zoom dependencies
sudo apt update && sudo apt full-upgrade
sudo apt install git build-essential cmake
git clone https://github.com/ptitSeb/box86
cd ~/box86 && mkdir build && cd build

# Raspberry Pi 4 Command
cmake .. -DRPI4=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo

# Raspberry Pi 3 Command
# cmake .. -DRPI3=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo

# Raspberry Pu 2 Command
# cmake .. -DRPI2=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo

make -j$(nproc)
sudo make install
sudo systemctl restart systemd-binfmt

# install Zoom
sudo apt-get install libxcb-xtest0
cd ~
wget https://zoom.us/client/5.4.53391.1108/zoom_i686.tar.xz
tar xvf zoom_i686.tar.xz