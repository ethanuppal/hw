#!/bin/bash
verilator \
    --cc -sv --build -j 0 -Wall \
    --top-module main \
     -CFLAGS "-shared -fpic" \
    --lib-create dynamic \
    ffi.cpp main.sv

# clang -fpic -shared -o libVmain.so \
#     -Wl,-force_load obj_dir/libVmain.a \
#     -Wl,-force_load obj_dir/libverilated.a \
#     -Wl,-force_load obj_dir/Vmain__ALL.a
