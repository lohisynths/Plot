#!/bin/bash
set -x

pwd 

rm -rf ../libs/*

make -j

cd ../

cd libs
ar -x /usr/lib/x86_64-linux-gnu/libboost_filesystem.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_system.a
ar -x /usr/lib/x86_64-linux-gnu/libboost_iostreams.a
ar -x ../Release/libPlot.a
ar -qc librap.a *.o
rm *.o
