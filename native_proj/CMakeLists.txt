cmake_minimum_required(VERSION 3.10)
project(native_proj)
include(GNUInstallDirs)

include_directories(include)
add_library(adder SHARED src/adder.cpp)


if(ANDROID)
    set(LIB_SUBDIR ${ANDROID_ABI})
else()
    set(LIB_SUBDIR ${CMAKE_SYSTEM_NAME})
endif()

# so installation
install(TARGETS adder
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/${LIB_SUBDIR})

# Headers installation
install(
        DIRECTORY ${CMAKE_SOURCE_DIR}/include/
        DESTINATION include
        FILES_MATCHING PATTERN "*.h"
)