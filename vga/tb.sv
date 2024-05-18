module tb;
    wire clk;
    reg reset = 0;
    /* verilator lint_off UNDRIVEN */
    /* verilator lint_off UNUSEDSIGNAL */
    wire h_sync;
    wire v_sync;
    wire[9:0] s_x;
    wire[9:0] s_y;
    wire data_enable;
    /* verilator lint_on UNUSEDSIGNAL */
    /* verilator lint_on UNDRIVEN */

    clock_gen #(1.0) pixel_clk(clk);
    display_640_480 display(clk, reset, h_sync, v_sync, s_x, s_y, data_enable);

    initial begin
        #48000; // 800 * 60
        $finish;
    end

    initial begin 
        $dumpfile("vga.vcd");
        $dumpvars(0, tb);
    end
endmodule
