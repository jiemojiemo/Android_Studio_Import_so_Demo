prompt() {
    echo "
    Options:
    -a [arm64-v8a|armeabi-v7a]: android abi
    example:
      $0 -a arm64-v8a
    "
}

if (($#==0)); then
    prompt
    exit 0
fi

ANDROID_ABI=arm64-v8a
while getopts "a:" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             a)
                if [ "$OPTARG" == "arm64-v8a" ]; then
                  ANDROID_ABI=$OPTARG
                elif [ "$OPTARG" == "armeabi-v7a" ]; then
                  ANDROID_ABI=$OPTARG
                else
                  echo "bad argument for android abi"
                  exit 1
                fi
                ;;
             ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
        exit 1
        ;;
        esac
done

echo "ANDROID_ABI: $ANDROID_ABI"

build_dir=build_state_android_$ANDROID_ABI
mkdir -p $build_dir
cd $build_dir || exit 1

ANDROID_NDK_HOME=~/NDK/android-ndk-r21/

cmake .. \
-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake \
-DANDROID_ABI=$ANDROID_ABI \
-DANDROID_STL=c++_shared \
-DCMAKE_INSTALL_PREFIX=../dist \
-DCMAKE_BUILD_TYPE=Release \

cmake --build . --target install -j8