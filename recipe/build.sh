#!/bin/bash

mkdir build
cd build

cmake -G "Unix Makefiles" \
      -DCMAKE_BUILD_TYPE="Release" \
      -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_POSITION_INDEPENDENT_CODE=1 \
      -DBUILD_STATIC=1 \
      -DBUILD_SHARED=1 \
      -DBUILD_TESTS=1 \
      -DBUILD_BENCHMARKS=0 \
      CMAKE_CXX=${CXX} \
      CMAKE_CC=${CC} \
      "${SRC_DIR}"

cmake --build . -- VERBOSE=1
ctest
cmake --build . --target install
