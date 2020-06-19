#! /bin/sh
cd build
cmake ..
make
sudo make install
# ./rsp_tcp
cd ..
exit
