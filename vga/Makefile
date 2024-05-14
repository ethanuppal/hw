VERILOG	:= $(shell find . -name "*.sv" -type f)

run: sim_main.cpp $(VERILOG)
	verilator --cc --exe --build --timing -j 0 $^ # -Wall
