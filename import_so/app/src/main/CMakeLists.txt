cmake_minimum_required(VERSION 3.10)

project(import_so_jni_project)

include_directories(cpp/include)
add_library(import_so_jni SHARED cpp/jni_src.cpp)

find_library(ADDER_LIB
        NAMES adder
        PATHS ${PROJECT_SOURCE_DIR}/lib/${ANDROID_ABI}
        NO_CMAKE_FIND_ROOT_PATH)

target_link_libraries(import_so_jni
        PRIVATE ${ADDER_LIB})