// Source for timings: http://martin.hinner.info/vga/timing.html
// 640x480, 60Hz

module display_640_480(input wire clk, input wire reset, output logic h_sync, 
    output logic v_sync, output logic[9:0] s_x, 
    output logic[9:0] s_y, output logic data_enable);

    parameter H_PIXELS = 640;
    parameter H_FRONT_PORCH = 16;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;

    parameter V_PIXELS = 480;
    parameter V_FRONT_PORCH = 11;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 31;

    parameter H_BLANK_START = H_PIXELS;
    parameter H_BLANK_END = H_BLANK_START + H_FRONT_PORCH + H_SYNC_PULSE 
        + H_BACK_PORCH;
    parameter H_SYNC_START = H_BLANK_START + H_FRONT_PORCH;
    parameter H_SYNC_END = H_SYNC_START + H_SYNC_PULSE;

    parameter V_BLANK_START = V_PIXELS;
    parameter V_BLANK_END = V_BLANK_START + V_FRONT_PORCH + V_SYNC_PULSE 
        + V_BACK_PORCH;
    parameter V_SYNC_START = V_BLANK_START + V_FRONT_PORCH;
    parameter V_SYNC_END = V_SYNC_START + V_SYNC_PULSE;

    initial begin 
        s_x = 0;
        s_y = 0;
    end

    always_comb begin
        h_sync = ~(s_x >= H_SYNC_START && s_x < H_SYNC_END);
        v_sync = ~(s_y >= V_SYNC_START && s_y < V_SYNC_END);
        data_enable = s_x < H_BLANK_START && s_y < V_BLANK_START;
    end

    always @(posedge clk) begin
        if (s_x == H_BLANK_END) begin
            s_x <= 0;
            s_y <= (s_y == V_BLANK_END) ? 0 : (s_y + 1);  
        end else begin
            s_x <= s_x + 1;
        end
        if (reset) begin
            s_x <= 0;
            s_y <= 0;
        end
    end
endmodule
