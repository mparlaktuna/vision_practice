#!/bin/bash

cd /app
mkdir -p build
cd build
cmake ../
make
ctest -V -R SimpleOps
