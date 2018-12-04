`default_nettype none
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2018 08:01:17 PM
// Design Name: 
// Module Name: chroma
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
parameter CHROMA_PRECISION = 16;
parameter CHROMA_WIDTH = (12*CHROMA_PRECISION)-1;
parameter DOT_PRECISION = 32 - 1;
parameter PEAK_THRESHOLD = 100;

module chroma_calculator(
    input wire clk,
    input wire valid_sample,
    input wire [11:0] new_sample_addr,
    input wire [CHROMA_PRECISION-1:0] new_sample_data,
    input wire last_sample,
    output reg [CHROMA_WIDTH:0] chroma,
    output reg done
);
 
    // We are given a spectogram which represents the intensity of frequencies 0-1024hz.
    // This spectogram is stored in a Block RAM indexed by spectogram_address.
    // We seek to iterate through spectogram indices, and add each value to one of 12 bins,
   
    parameter INNER_CHROMA_PRECISION = 18;
    parameter INNER_CHROMA_WIDTH = (INNER_CHROMA_PRECISION*12)-1;
    parameter BIT_DIFFERENCE = INNER_CHROMA_PRECISION - CHROMA_PRECISION;
   
    reg[INNER_CHROMA_WIDTH:0] inner_chroma;
    wire[3:0] chroma_bin;
    integer i;
    
    reg [11:0] prev_addr;
    reg [11:0] prev_prev_addr;
    reg [11:0] prev_prev_prev_addr;
    reg [15:0] prev_data;
    reg [15:0] prev_prev_data;
    chroma_bins chroma_binz (
          .clka(clk),    // input wire clka
          .ena(1),      // input wire ena
          .addra(new_sample_addr[10:0]),  // input wire [10 : 0] addra
          .douta(chroma_bin)  // output wire [3 : 0] douta
        );      
            
    always @(posedge clk) begin
        prev_addr <= new_sample_addr;
        prev_prev_addr <= prev_addr;
        prev_prev_prev_addr <= prev_prev_addr;
        prev_data <= new_sample_data;
        prev_prev_data <= prev_data;
        if (valid_sample && (prev_prev_prev_addr != prev_prev_addr)) begin
            if (last_sample) begin
                for (i=0; i<12; i=i+1) begin
                    chroma[i*CHROMA_PRECISION +: CHROMA_PRECISION] <= inner_chroma[i*INNER_CHROMA_PRECISION +: INNER_CHROMA_PRECISION] >> BIT_DIFFERENCE;
                end
                done <= 1;
                inner_chroma <= 0;
            end
            else begin
                done <= 0;
                if (prev_prev_addr < 2048 && chroma_bin < 12) begin
                    inner_chroma[chroma_bin*INNER_CHROMA_PRECISION +: INNER_CHROMA_PRECISION] <= inner_chroma[chroma_bin*INNER_CHROMA_PRECISION +: INNER_CHROMA_PRECISION] + prev_prev_data;
                end
            end
        end
    end
 
endmodule
