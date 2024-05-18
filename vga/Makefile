# Copyright (C) 2024 Ethan Uppal. All rights reserved.

VERILOG	:= $(shell find . -name "*.v" -type f) \
		   $(shell find . -name "*.sv" -type f)

# Use icarus-verilog
IV_TARGET := main
iv: $(VERILOG)
	iverilog -g2012 -o $(IV_TARGET) $^
	./$(IV_TARGET)

# Verilate
# This doesn't work yet (https://github.com/verilator/verilator/pull/5031) and
# my attempts to get it working were fruitless.
VL_TOP := tb
VL_CPPFLAGS := -I /usr/local/include/c++fix #\
			# -I /opt/homebrew/Cellar/gcc/13.2.0/include/c++/13/aarch64-apple-darwin22/ \
			# -I /opt/homebrew/Cellar/gcc/13.2.0/include/c++/13/bits

vl: $(VERILOG) sim_main.cpp
	verilator --cc --exe -sv --build --timing -j 0 -CFLAGS "$(VL_CPPFLAGS)" --top-module $(VL_TOP) -Wall $^

viz: iv
	gtkwave vga.vcd
