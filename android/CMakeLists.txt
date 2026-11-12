cmake_minimum_required(VERSION 3.4.1)

add_library(bbhelper SHARED c++/directBufferAndroid.cpp)

target_compile_options(bbhelper PRIVATE -DBUILD_FOR_ANDROID)

# Ensure ELF segments are aligned for 16KB page size compatibility (Android 15+)
target_link_options(bbhelper PRIVATE "-Wl,-z,max-page-size=16384")
