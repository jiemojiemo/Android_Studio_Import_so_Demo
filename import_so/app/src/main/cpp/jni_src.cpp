//
// Created by hw on 2020/4/26.
//

#include "adder.h"
#include <jni.h>

extern "C"
JNIEXPORT jint JNICALL Java_com_bytedance_importso_MainActivity_add(
    JNIEnv* env, jobject obj, jint a, jint b)
{
    return Adder::add(a, b);
}