#!/bin/bash

mkdir build
cd build

<<<<<<< HEAD
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
=======
export LDFLAGS=${LDFLAGS}" -Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib"

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_STATIC:BOOL=OFF \
      -DPREFER_EXTERNAL_SNAPPY:BOOL=ON \
      -DPREFER_EXTERNAL_LZ4:BOOL=ON \
      -DPREFER_EXTERNAL_ZLIB:BOOL=ON \
      CMAKE_CXX=${CXX} \
      CMAKE_CC=${CC} \
      ..
>>>>>>> use external libs for zlib, snappy.  add run_exports

cmake --build .
cmake --build . --target install
ctest
