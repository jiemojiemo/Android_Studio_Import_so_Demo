mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../dist
cmake --build . --target install -j8