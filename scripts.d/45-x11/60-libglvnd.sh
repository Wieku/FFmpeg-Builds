#!/bin/bash

SCRIPT_REPO="https://gitlab.freedesktop.org/glvnd/libglvnd.git"
SCRIPT_COMMIT="606f6627cf481ee6dcb32387edc010c502cdf38b"

ffbuild_enabled() {
    [[ $TARGET != linux* ]] && return -1
    return -1
}

ffbuild_dockerbuild() {
    mkdir build && cd build

    local myconf=(
        --prefix="$FFBUILD_PREFIX"
        --buildtype=release
        --default-library=static
        -Dasm=enabled
        -Dx11=enabled
        -Degl=true
        -Dglx=enabled
        -Dgles1=true
        -Dgles2=true
        -Dheaders=true
    )

    if [[ $TARGET == linux* ]]; then
        myconf+=(
            --cross-file=/cross.meson
        )
    else
        echo "Unknown target"
        return -1
    fi

    meson "${myconf[@]}" ..
    ninja -j"$(nproc)"
    ninja install
}
