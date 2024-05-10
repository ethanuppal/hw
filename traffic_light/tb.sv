module tb;
    reg clk;
    wire[2:0] east_west;
    wire[2:0] north_south;

    traffic_light tl(clk, east_west, north_south);

    initial begin 
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin 
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb);
    end

    initial begin
        #25;
        $finish;
    end
endmodule
