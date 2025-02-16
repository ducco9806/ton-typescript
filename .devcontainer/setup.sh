#!/bin/bash
set -e

# Update system
sudo apt-get update && sudo apt-get install -y \
curl \
wget \
build-essential \
cmake \
git \
golang \
clang \
libc++-dev \
pkg-config

# Clone TON source and build FunC
git clone --recursive https://github.com/ton-blockchain/ton.git ~/ton
cd ~/ton
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

# Install tvm-cli and FunC from Cargo
cargo install tvm-cli
cargo install func

echo "Installation complete!"
echo "Install TON Solodity Compiler..."
cargo install ton-solc

###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget

# Download the PowerShell package file
wget https://github.com/PowerShell/PowerShell/releases/download/v7.5.0/powershell_7.5.0-1.deb_amd64.deb

###################################
# Install the PowerShell package
sudo dpkg -i powershell_7.5.0-1.deb_amd64.deb

# Resolve missing dependencies and finish the install (if necessary)
sudo apt-get install -f

# Delete the downloaded package file
rm powershell_7.5.0-1.deb_amd64.deb

# Start PowerShell Preview
pwsh