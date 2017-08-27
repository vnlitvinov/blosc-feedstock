#!/bin/bash

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX CMAKE_CXX=${CXX} CMAKE_CC=${CC} ..

cmake --build .
ctest
cmake --build . --target install
