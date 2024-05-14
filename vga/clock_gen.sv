`timescale 1ps/1ps

module clock_gen(output reg clk);
    parameter FREQ = 25.2 * 1_000_000;
    parameter PERIOD = 1.0 / FREQ;

    initial begin 
        clk = 0;
        forever 
            #PERIOD clk = ~clk;
    end
endmodule
