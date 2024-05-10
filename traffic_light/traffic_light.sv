// Copyright (C) 2024 Ethan Uppal. All rights reserved.
// based on:
// https://web.csl.cornell.edu/courses/ece2300/pdf/Lecture09.pdf
// https://web.csl.cornell.edu/courses/ece2300/pdf/Lecture10.pdf

`define GREEN 3'b001;
`define YELLOW 3'b010;
`define RED 3'b100;

module light_controller(input wire clk, input wire next, output reg green, 
    output reg[2:0] east_west, output reg[2:0] north_south);

    parameter GR = 2'b00;
    parameter YR = 2'b01;
    parameter RG = 2'b10;
    parameter RY = 2'b11;

    // AF: a 2-bit state is XY where X is the color of the east-west light and Y is the color of the north-south light
    reg[1:0] scur, snext;

    initial begin
        scur = RY;
    end

    // green/red lights will transition when the timing control requests
    // yellow lights will always transition to the next lighting state
    always @(scur, next) begin
        case (scur)
        GR: if (next == 1) snext = YR; else snext = GR; 
        YR: snext = RG;
        RG: if (next == 1) snext = YR; else snext = RG; 
        RY: snext = GR;
        default: snext = GR;
        endcase
    end

    always @(scur) begin 
        case (scur)
        GR: begin
            green = 1;
            east_west = `GREEN; 
            north_south = `RED;
        end
        YR: begin
            green = 0;
            east_west = `YELLOW;
            north_south = `RED;
        end 
        RG: begin
            green = 1;
            east_west = `RED;
            north_south = `GREEN; 
        end
        RY: begin
            green = 0;
            east_west = `RED;
            north_south = `YELLOW; 
        end
        endcase
    end

    always @(posedge clk) begin
        scur <= snext;
    end
endmodule

module timer(input wire clk, input wire green, output reg next);
    parameter NG = 2'b00;
    parameter G1 = 2'b01;
    parameter G2 = 2'b10;
    parameter G3 = 2'b11;

    reg[1:0] scur, snext;

    initial begin 
        scur = NG;
    end

    always @(scur, green) begin
        case (scur)
            NG: if (green == 1) snext = NG; else snext = G1;
            G1: snext = G2;
            G2: snext = G3;
            G3: snext = NG;
            default: snext = NG;
        endcase
    end

    always @(scur) begin
        if (scur == NG) next = 1; else next = 0;
    end

    always @(posedge clk) begin
        scur <= snext;
    end
endmodule

module traffic_light(input wire clk, output wire[2:0] east_west, 
output wire[2:0] north_south);

    wire green, next;

    timer t(clk, green, next);
    light_controller lc(clk, next, green, east_west, north_south);
endmodule
