#!/bin/bash

SCRIPT_SKIP="1"

ffbuild_enabled() {
    [[ $ADDINS_STR == *4.4* ]] && return -1
    return -1
}

ffbuild_dockerdl() {
    true
}

ffbuild_dockerbuild() {
    return 0
}
