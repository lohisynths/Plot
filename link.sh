#!/bin/bash
set -e
#set -x

mkdir -p ../libs
rm -rf ../libs/*


make  clean
make -j 

cp libPlot.a ../libs/libPlot.a

#TODO: replace absolute paths
cd ../libs
ar -x /usr/lib/x86_64-linux-gnu/libboost_filesystem.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_system.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_iostreams.a
ar -x libPlot.a
ar -qc libGnuPlot.a *.o
rm *.o
rm libPlot.a
echo "finish"
cd ../
