#!/bin/bash

SCRIPT_REPO="https://gitlab.freedesktop.org/xorg/lib/libxext.git"
SCRIPT_COMMIT="3826a58d190c2d8093d3586cb33867668cbb4553"

ffbuild_enabled() {
    [[ $TARGET != linux* ]] && return -1
    return -1
}

ffbuild_dockerbuild() {
    autoreconf -i

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --enable-shared
        --disable-static
        --with-pic
        --without-xmlto
        --without-fop
        --without-xsltproc
        --without-lint
    )

    if [[ $TARGET == linuxarm64 ]]; then
        myconf+=(
            --disable-malloc0returnsnull
        )
    fi

    if [[ $TARGET == linux* ]]; then
        myconf+=(
            --host="$FFBUILD_TOOLCHAIN"
        )
    else
        echo "Unknown target"
        return -1
    fi

    export CFLAGS="$RAW_CFLAGS -D_GNU_SOURCE"
    export LDFLAFS="$RAW_LDFLAGS"

    ./configure "${myconf[@]}"
    make -j$(nproc)
    make install

    gen-implib "$FFBUILD_PREFIX"/lib/{libXext.so.6,libXext.a}
    rm "$FFBUILD_PREFIX"/lib/libXext{.so*,.la}
}
