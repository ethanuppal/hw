module blinker(
    input wire clk,
    output reg led = 0
);

always @(posedge clk) begin
    led <= ~led;
end

endmodule
