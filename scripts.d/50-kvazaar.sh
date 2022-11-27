#!/bin/bash

SCRIPT_REPO="https://github.com/ultravideo/kvazaar.git"
SCRIPT_COMMIT="a4005046ae2ebb3c88e92ff06736ce57b60fdcc7"

ffbuild_enabled() {
    return -1
}

ffbuild_dockerbuild() {
    git-mini-clone "$SCRIPT_REPO" "$SCRIPT_COMMIT" kvazaar
    cd kvazaar

    ./autogen.sh

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --disable-shared
        --enable-static
        --with-pic
    )

    if [[ $TARGET == win* || $TARGET == linux* ]]; then
        myconf+=(
            --host="$FFBUILD_TOOLCHAIN"
        )
    else
        echo "Unknown target"
        return -1
    fi

    ./configure "${myconf[@]}"
    make -j$(nproc)
    make install

    echo "Cflags.private: -DKVZ_STATIC_LIB" >> "$FFBUILD_PREFIX"/lib/pkgconfig/kvazaar.pc
}

ffbuild_configure() {
    echo --enable-libkvazaar
}

ffbuild_unconfigure() {
    echo --disable-libkvazaar
}
