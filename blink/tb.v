module tb;
    reg clk;
    wire led;

    blinker blnk(clk, led);

    initial begin 
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin 
        $dumpfile("blinker.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        #20; // Wait for 2000 time units
        $finish; // End the simulation
    end
endmodule
