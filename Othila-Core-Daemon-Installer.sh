#!/bin/bash

# Functions
add_ppa(){
  grep -h "bitcoin" /etc/apt/sources.list.d/* > /dev/null
  if [ $? -ne 0 ]
  then
    echo "Adding Bitcoin PPA."
    yes "" | add-apt-repository ppa:bitcoin/bitcoin
  else
    echo "Bitcoin PPA already exists!"
  fi
}

# Entrypoint
cd ..

# Add Bitcoin PPA
add_ppa && apt-get update

# Install Dependancies
apt-get -qq install zip curl \
        build-essential \
        libtool \
        autotools-dev \
        autoconf automake pkg-config \
        libssl-dev \
        libevent-dev \
        libboost-all-dev \
        software-properties-common \
        libdb4.8-dev libdb4.8++-dev \
        libminiupnpc-dev libzmq3-dev \
        libgmp3-dev

# Clone the Othila Core repository and compile
git clone https://github.com/othila-crypto/Othila.git
cd Othila
./autogen.sh
./configure --with-unsupported-ssl --without-gui
make -j$(nproc)

echo "Build complete. Installing now!"
make install

chown -R $(logname): ../Othila

echo
echo -e "\e[1m\e[92mSetup complete! Now run othilad --daemon\e[0m"
echo