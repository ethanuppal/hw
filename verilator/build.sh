#!/bin/bash
verilator \
    --cc --exe -sv --build -j 0 -Wall \
    --top-module main \
    main.cpp main.sv
