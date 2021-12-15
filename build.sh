#!/bin/bash

mkdir -p build
pushd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j4
make install
popd

