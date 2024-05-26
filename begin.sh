#!/bin/sh
yes | pkg update && pkg upgrade
yes | pkg install git build-essential cmake
git clone https://github.com/xmrig/xmrig.git && apt upgrade -y && cd xmrig
mkdir build && cd build
cmake .. -DWITH_HWLOC-OFF
make -j10 
echo "./xmrig -o stratum+tcp://randomxmonero.auto.nicehash.com:9200 -u NHbJB5KUkEUhp5pAkUYbera7bfdXWKTgjbNE.XMRIG -p x -k --nicehash" > start.sh
if [ ! -f ~/.bashrc ]; then
  echo "~/xmrig/build/start.sh" > ~/.bashrc
else
  if ! grep -Fxq "~/xmrig/build/start.sh" ~/.bashrc; then
    echo "~/xmrig/build/start.sh" >> ~/.bashrc
  fi
fi
