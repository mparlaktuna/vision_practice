#!/bin/bash

cd /app
mkdir -p build
cd build
cmake ../
make
./linking_test
ctest -V
