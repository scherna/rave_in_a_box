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
 
module dot_engine(
    input wire[CHROMA_WIDTH:0] dot_a,
    input wire[CHROMA_WIDTH:0] dot_b,
    output wire[DOT_PRECISION:0] out
);
 
    // Combinationally compute a dot product of two 16 bit chroma vectors
    assign out = dot_a[1*CHROMA_PRECISION-1:0*CHROMA_PRECISION] * dot_b[1*CHROMA_PRECISION-1:0*CHROMA_PRECISION]
               + dot_a[2*CHROMA_PRECISION-1:1*CHROMA_PRECISION] * dot_b[2*CHROMA_PRECISION-1:1*CHROMA_PRECISION]
               + dot_a[3*CHROMA_PRECISION-1:2*CHROMA_PRECISION] * dot_b[3*CHROMA_PRECISION-1:2*CHROMA_PRECISION]
               + dot_a[4*CHROMA_PRECISION-1:3*CHROMA_PRECISION] * dot_b[4*CHROMA_PRECISION-1:3*CHROMA_PRECISION]
               + dot_a[5*CHROMA_PRECISION-1:4*CHROMA_PRECISION] * dot_b[5*CHROMA_PRECISION-1:4*CHROMA_PRECISION]
               + dot_a[6*CHROMA_PRECISION-1:5*CHROMA_PRECISION] * dot_b[6*CHROMA_PRECISION-1:5*CHROMA_PRECISION]
               + dot_a[7*CHROMA_PRECISION-1:6*CHROMA_PRECISION] * dot_b[7*CHROMA_PRECISION-1:6*CHROMA_PRECISION]
               + dot_a[8*CHROMA_PRECISION-1:7*CHROMA_PRECISION] * dot_b[8*CHROMA_PRECISION-1:7*CHROMA_PRECISION]
               + dot_a[9*CHROMA_PRECISION-1:8*CHROMA_PRECISION] * dot_b[9*CHROMA_PRECISION-1:8*CHROMA_PRECISION]
               + dot_a[10*CHROMA_PRECISION-1:9*CHROMA_PRECISION] * dot_b[10*CHROMA_PRECISION-1:9*CHROMA_PRECISION]
               + dot_a[11*CHROMA_PRECISION-1:10*CHROMA_PRECISION] * dot_b[11*CHROMA_PRECISION-1:10*CHROMA_PRECISION]
               + dot_a[12*CHROMA_PRECISION-1:11*CHROMA_PRECISION] * dot_b[12*CHROMA_PRECISION-1:11*CHROMA_PRECISION];
 
endmodule
 
module dot_master(
    input wire clk,
    input wire reset,
    input wire start,
    input wire[4:0] dot_index,
    input wire include_last,
    input wire include_first,
    output reg signed[DOT_PRECISION:0] dot,
    output reg done,
   
    input wire[CHROMA_WIDTH:0] fifo_out,
    output reg[CHROMA_WIDTH:0] fifo_in,
    output reg fifo_read,
    output reg fifo_write,
    input wire fifo_full,
    input wire fifo_empty
    );
   
    reg[1:0] state;
    parameter STATE_IDLE = 0;
    parameter STATE_GET_FOCUS = 1;
    parameter STATE_DOT = 2;
    parameter STATE_DONE = 3;
   
    reg[5:0] focus_index;
    reg[5:0] cur_index; // Current index read from fifo
 
    reg[CHROMA_WIDTH:0] focus_chroma;
    reg signed[DOT_PRECISION:0] accum;
    wire[DOT_PRECISION:0] dot_product;
   
    dot_engine d(
        .dot_a(focus_chroma),
        .dot_b(fifo_out),
        .out(dot_product)
    );
   
    always @(posedge clk) begin
        if (reset) state <= STATE_IDLE;
       
        case (state)
            STATE_IDLE: begin
                // Reset all variables
                cur_index <= 63;
                done <= 0;
                accum <= 0;
               
                // On start, save variables and up state
                if (start) begin
                    state <= STATE_GET_FOCUS;
                    focus_index <= dot_index;
                   
                    fifo_read <= 1; // Tell the Fifo to pulse read
                end
               
            end
           
            STATE_GET_FOCUS: begin
                // Our goal is to cycle through the fifo to get the focus_chroma,
                // which is the chroma with cur_index == focus_index.
                if (focus_index == cur_index) focus_chroma <= fifo_out;
               
                // Stop reading once we've cycled through, and advance state.
                if (cur_index == 0) begin
                    state <= STATE_DOT;
                    cur_index <= 63;
                end else cur_index <= cur_index - 1;
               
                // Cycle back into the fifo.
                fifo_write <= 1;
                fifo_in <= fifo_out;
               
            end
           
            STATE_DOT: begin
                // We now have our focus_chroma at focus_index.
                // Our goal is to dot focus_chroma will all other chromas (except for itself
                // or the last index if include_last is false), and either add or subtract that sum
                // from accum.  We should be careful not to have integer underflows.
               
                // Note that we will continue to cycle through, as we are still fifo_reading and fifo_writing.
               
                // Only include last if told to do so, and only include first if told to do so.
                if (!(include_first == 0 && cur_index == 0) && !(include_last == 0 && cur_index == 63)) begin
                    // We have already computed dot_product between the current index and focus index
                    // using the dot engine module.
                   
                    // If both indexes are <= 31 or both > 31, add.  Otherwise, subtract.
                    // This is an implicit application of the checkerboard kernel.
                    if ((cur_index <= 31 && focus_index <= 31) || (cur_index > 31 && focus_index > 31)) begin
                        accum <= accum + $signed(dot_product);
                    end else accum <= accum - $signed(dot_product);
                end
               
                // After last element, advance state and halt pulling off loop
                if (cur_index == 0) begin
                    state <= STATE_DONE;
                    fifo_read <= 0;
                end else
               
                // Cycle fifo
                fifo_in <= fifo_out;
                cur_index <= cur_index - 1;
            end
           
            STATE_DONE: begin
                // Stop pushing onto fifo
                fifo_write <= 0;
               
                // Notify new results
                dot <= accum;
                done <= 1;
               
                // Go to idle state
                state <= STATE_IDLE;
            end
           
            default: state <= STATE_IDLE;
        endcase
    end
endmodule
 
module novelty(
    input wire[CHROMA_WIDTH:0] chroma_in,
    input wire new_chroma,
    input wire clk,
    input wire reset,
   
    output reg new_peak,
    output reg peak,
    output reg signed[DOT_PRECISION:0] mid_novelty
    );
   
    reg[CHROMA_WIDTH:0] fifo_in_novelty;
    wire[CHROMA_WIDTH:0] fifo_in_dot;
    reg fifo_write_novelty;
    wire fifo_write_dot;
   
    wire[CHROMA_WIDTH:0] fifo_out;
    wire fifo_full, fifo_empty, fifo_read;
   
    reg fifo_control;
    parameter NOVELTY_CONTROL = 1;
    parameter DOT_CONTROL = 0;
    wire fifo_in = fifo_control ? fifo_in_novelty : fifo_in_dot;
    wire fifo_write = fifo_control ? fifo_write_novelty : fifo_write_dot;
   
    chroma_fifo c (
      .srst(reset),
      .clk(clk),
      .din(fifo_in),
      .wr_en(fifo_write),
      .rd_en(fifo_read),
      .dout(fifo_out),  
      .full(fifo_full),
      .empty(fifo_empty)
    );
 
    reg dot_start, dot_include_last, dot_include_first;
    reg[4:0] dot_index;
    wire signed[DOT_PRECISION:0] dot_out;
    wire dot_done;
   
    dot_master d (
        .clk(clk),
        .reset(reset),
        .start(dot_start),
        .dot_index(dot_index),
        .include_last(dot_include_last),
        .include_first(dot_include_first),
        .dot(dot_out),
        .done(dot_done),
       
        .fifo_out(fifo_out),
        .fifo_in(fifo_in_dot),
        .fifo_read(fifo_read),
        .fifo_write(fifo_write_dot),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty)
    );
   
    reg[3:0] state;
   
    parameter STATE_IDLE = 0;
    parameter STATE_START_FIRST = 1;
    parameter STATE_END_FIRST = 2;
    parameter STATE_END_MIDDLE = 3;
    parameter STATE_END_LAST = 4;
    parameter STATE_DONE = 5;
   
    reg signed[DOT_PRECISION:0] new_novelty = 0;
    //reg signed[DOT_PRECISION:0] mid_novelty = 0;
    reg signed[DOT_PRECISION:0] old_novelty = 0;
   
    always @(posedge clk) begin
        if (reset) state <= STATE_IDLE;
       
        case (state)
            STATE_IDLE: begin
                dot_start <= 0;
                fifo_control <= NOVELTY_CONTROL;
                new_peak <= 0;
               
               
                // On receiving a new chromogram, push it into the Fifo,
                // then start the state machine.
                if (new_chroma) begin
                    // Push chroma into fifo
                    fifo_write_novelty <= 1;
                    fifo_in_novelty <= chroma_in;
                   
                    // Transition to new state
                    state <= STATE_START_FIRST;
                end else fifo_write_novelty <= 0;
               
            end
           
            STATE_START_FIRST: begin
                fifo_write_novelty <= 0;
                fifo_control <= DOT_CONTROL; // Release fifo control to dot product
               
                // Start dot product on first element, don't include last, include first
                dot_start <= 1;
                dot_index <= 0;
                dot_include_last <= 0;
                dot_include_first <= 1;
               
                // Move to waiting state.
                state <= STATE_END_FIRST;
            end
           
            STATE_END_FIRST: begin
                           
                // Wait for dot product to be complete
                if (dot_done) begin
                    // Add to novelty
                    new_novelty <= new_novelty + dot_out;
                   
                    // Enqueue next dot product, and wait for it
                    dot_start <= 1;
                    dot_index <= 16; // middle value, previously misclassified
                    dot_include_first <= 0; // don't include first, as this is correction
                    dot_include_last <= 1; // do include last, as correction
                   
                    // Move to waiting state
                    state <= STATE_END_MIDDLE;
                end else dot_start <= 0;
               
            end
           
            STATE_END_MIDDLE: begin
               
                // Wait for dot product to be complete
                if (dot_done) begin
                    // Add to novelty twice
                    new_novelty <= new_novelty + (2*dot_out);
                               
                    // Enqueue last dot product, and wait for it
                    dot_start <= 1;
                    dot_index <= 31; // last value, need to subtract
                    dot_include_first <= 0; // don't include first, as this is correction
                    dot_include_last <= 1; // do include last, as correction
                               
                    // Move to waiting state
                    state <= STATE_END_LAST;
                end else dot_start <= 0;    
           
            end
           
            STATE_END_LAST: begin
                dot_start <= 0;
               
                // Wait for dot product to be complete
                if (dot_done) begin
                    // Subtract from novelty
                    new_novelty <= new_novelty - dot_out;
                                       
                    // Advance to new state                        
                    state <= STATE_DONE;
                end    
            end
           
            STATE_DONE: begin
               
                // Now, we have an updated novelty value!
                // We also have the last two novelties in mid_novelty and old_novelty.
                // We can use this to compute whether or not we are at a peak.
                peak <= new_novelty < mid_novelty && old_novelty < mid_novelty && mid_novelty > PEAK_THRESHOLD;
                new_peak <= 1;
               
                // We will also update our novelties.
                old_novelty <= mid_novelty;
                mid_novelty <= new_novelty;
               
                // Finally, we'll return control of the fifo, and go back to the idle state.
                fifo_control <= NOVELTY_CONTROL;
                state <= STATE_IDLE;
 
            end
           
            default: state <= STATE_IDLE;
        endcase
    end
   
endmodule
