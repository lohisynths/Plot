#!/bin/bash
set -x

rm -rf ../libs/*

make -j
cp libPlot.a ../libs/libPlot.a

cd ../libs
ar -x /usr/lib/x86_64-linux-gnu/libboost_filesystem.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_system.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_iostreams.a
ar -x libPlot.a
ar -qc librap.a *.o

rm *.o
rm libPlot.a
