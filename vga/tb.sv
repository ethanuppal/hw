`timescale 1ps/1ps

module tb;
    wire clk;
    reg reset;
    wire h_sync;
    wire v_sync;
    wire[9:0] s_x;
    wire[9:0] s_y;
    wire data_enable;

    clock_gen pixel_clk(clk);
    display_640_480 display(clk, reset, h_sync, v_sync, s_x, s_y, data_enable);
endmodule
