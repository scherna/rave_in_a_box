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
parameter DOT_PRECISION = 60 - 1;
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
        end else done <= 0;
    end
 
endmodule
 
module dot_engine(
    input wire[CHROMA_WIDTH:0] dot_a,
    input wire[CHROMA_WIDTH:0] dot_b,
    output wire[42:0] out
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

module accumulator(
    input wire clk,
    input wire rst,
    input wire new_addition,
    input wire [42:0] accumulate,
    input wire sign,
    output reg [134:0] accumulated
);

    reg state = 0;
    parameter RESET = 0;
    parameter COLLECT = 1;
    always @ (posedge clk) begin
        case (state)
            RESET: begin
                accumulated <= 1 << 49;
                state <= COLLECT;
            end
            COLLECT: begin
                if (rst) state <= RESET;
                else begin
                    if (new_addition) begin
                        if (sign) accumulated <= accumulated - accumulate;
                        else accumulated <= accumulated + accumulate;
                    end
                end
            end
            default: state <= RESET;
        endcase
    end

endmodule

module fifo_controller(
    input wire clk,
    input wire rst,
    input wire [2:0] mode,
    input wire [191:0] new_fifo_input,
    output wire [191:0] fifo_output,
    output wire [4:0] data_count,
    output wire fifo_full,
    output wire fifo_empty
);

    reg fifo_read, fifo_write;
    reg [191:0] fifo_in;
    parameter FIFO_IDLE = 0;
    parameter FIFO_LOAD = 1;
    parameter FIFO_UNLOAD = 2;
    parameter FIFO_CYCLE = 3;
    parameter FIFO_SHIFT = 4;
    
    always @ (*) begin
        case (mode)
            FIFO_IDLE: begin
                fifo_read = 0;
                fifo_write = 0;
            end
            FIFO_LOAD: begin
                fifo_read = 0;
                fifo_write = 1;
                fifo_in = new_fifo_input;       
            end
            FIFO_UNLOAD: begin
                fifo_read = 1;
                fifo_write = 0;
            end
            FIFO_CYCLE: begin
                fifo_read = 1;
                fifo_write = 1;
                fifo_in = fifo_output;
            end
            FIFO_SHIFT: begin
                fifo_read = 1;
                fifo_write = 1;
                fifo_in = new_fifo_input;
            end
        endcase
    end
    
    chroma_fifo c (
          .srst(rst),
          .clk(clk),
          .din(fifo_in),
          .wr_en(fifo_write),
          .rd_en(fifo_read),
          .dout(fifo_output),  
          .full(fifo_full),
          .empty(fifo_empty),
          .data_count(data_count)
        );
    

endmodule

module novelty_calc (
    input wire clk,
    input wire rst,
    input wire [191:0] new_chroma,
    input wire chroma_done
);

    parameter FIFO_IDLE = 0;
    parameter FIFO_LOAD = 1;
    parameter FIFO_UNLOAD = 2;
    parameter FIFO_CYCLE = 3;
    parameter FIFO_SHIFT = 4;
    
    parameter NOVELTY_IDLE = 0;
    parameter NOVELTY_LOAD = 1;
    parameter NOVELTY_STORE_OLDEST_INT = 11;
    parameter NOVELTY_STORE_OLDEST = 2;
    parameter NOVELTY_DOT_NEWEST = 3;
    parameter NOVELTY_ADD_NEWEST = 4;
    parameter NOVELTY_DOT_OLDEST = 5;
    parameter NOVELTY_ADD_OLDEST = 6;  
    parameter NOVELTY_COLLECT_MIDDLE = 7;
    parameter NOVELTY_DOT_MIDDLE = 8;
    parameter NOVELTY_ADD_MIDDLE = 9;
    parameter NOVELTY_ADD_DELTA = 10;
    parameter NOVELTY_DOT_MIDDLE_AGAIN = 12;
    
    reg state;
    reg [2:0] fifo_mode;
    reg [191:0] new_fifo_input;
    wire [191:0] fifo_output;
    wire [4:0] data_count;
    wire fifo_full, fifo_empty;
    
    reg [4:0] current_index;
    
    reg [191:0] dot_a, dot_b;
    wire [42:0] dot_out;
    
    reg add_to_total_novelty, add_to_delta_novelty;
    reg add_to_total_novelty_sign, add_to_delta_novelty_sign;
    wire [134:0] accumulated_total_novelty, accumulated_delta_novelty;
    reg [42:0] total_novelty_addition, delta_novelty_addition; 
    reg delta_novelty_reset;
    
    reg [191:0] oldest_chroma, newest_chroma, middle_chroma;
    
    always @ (posedge clk) begin
        if (fifo_mode == FIFO_UNLOAD || fifo_mode == FIFO_CYCLE || fifo_mode == FIFO_SHIFT) current_index <= current_index - 1;
        case (state)
            NOVELTY_IDLE: begin
            
                
                delta_novelty_reset <= 1;
                total_novelty_addition <= 0;
                delta_novelty_addition <= 0;
                oldest_chroma <= 0;
                middle_chroma <= 0;
                current_index <= 0;
                
                if (chroma_done) begin
                    newest_chroma <= new_chroma;
                    if (fifo_full) begin
                        state <= NOVELTY_STORE_OLDEST_INT;
                        
                    end
                    else begin
                        state <= NOVELTY_LOAD;
                    end
                end
                else newest_chroma <= 0;
            end
            NOVELTY_LOAD: begin
                state <= NOVELTY_IDLE;
            end
            NOVELTY_STORE_OLDEST_INT: begin
                state <= NOVELTY_STORE_OLDEST;
            end
            NOVELTY_STORE_OLDEST: begin
                oldest_chroma <= fifo_output;
                state <= NOVELTY_DOT_NEWEST;
            end
            NOVELTY_DOT_NEWEST: begin
                if (current_index == 0) state <= NOVELTY_DOT_OLDEST;
            end
            NOVELTY_DOT_OLDEST: begin
                if (current_index == 0) state <= NOVELTY_COLLECT_MIDDLE;
            end
            NOVELTY_COLLECT_MIDDLE: begin
                if (current_index == 16) middle_chroma <= fifo_output;
                else if (current_index == 0) state <= NOVELTY_DOT_MIDDLE;
            end
            NOVELTY_DOT_MIDDLE: begin
                if (current_index == 0) state <= NOVELTY_DOT_MIDDLE_AGAIN;
            end
            NOVELTY_DOT_MIDDLE_AGAIN: begin
            
            end
        endcase
        
    end
    
    always @ (*) begin
        case (state)
            NOVELTY_IDLE: begin
                fifo_mode = FIFO_IDLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = 0;
                dot_a = 0;
                dot_b = 0;
            end
            NOVELTY_LOAD: begin
                fifo_mode = FIFO_LOAD;
                new_fifo_input = newest_chroma;
                add_to_total_novelty = 0;
                add_to_delta_novelty = 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = 0;
                dot_a = 0;
                dot_b = 0;
            end
            NOVELTY_STORE_OLDEST_INT: begin
                fifo_mode = FIFO_SHIFT;
                new_fifo_input = newest_chroma;
                add_to_total_novelty = 0;
                add_to_delta_novelty = 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = 0;
                dot_a = 0;
                dot_b = 0;
            end
            NOVELTY_STORE_OLDEST: begin
                fifo_mode = FIFO_IDLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = 0;
                dot_a = 0;
                dot_b = 0;
            end
            NOVELTY_DOT_NEWEST: begin
                fifo_mode = FIFO_CYCLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = current_index != 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = current_index > 15;
                dot_a = newest_chroma;
                dot_b = fifo_output;           
            end
            NOVELTY_DOT_OLDEST: begin
                fifo_mode = FIFO_CYCLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = current_index != 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = current_index > 16;
                dot_a = oldest_chroma;
                dot_b = fifo_output;
            end
            NOVELTY_COLLECT_MIDDLE: begin
                fifo_mode = FIFO_CYCLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = 0;
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = 0;
                dot_a = 0;
                dot_b = 0;
            end
            NOVELTY_DOT_MIDDLE: begin
                fifo_mode = FIFO_CYCLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = (current_index != 16) && (current_index != 0);
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = current_index < 16;
                dot_a = middle_chroma;
                dot_b = fifo_output;
            end
            NOVELTY_DOT_MIDDLE_AGAIN: begin
                fifo_mode = FIFO_CYCLE;
                new_fifo_input = 0;
                add_to_total_novelty = 0;
                add_to_delta_novelty = (current_index != 16) && (current_index != 0);
                add_to_total_novelty_sign = 0;
                add_to_delta_novelty_sign = current_index < 16;
                dot_a = middle_chroma;
                dot_b = fifo_output;
            end
        endcase
    end
    
    dot_engine dotter(
        .dot_a(dot_a),
        .dot_b(dot_b),
        .out(dot_out)
    );

    fifo_controller fifo_control(
        .clk(clk),
        .rst(rst),
        .mode(fifo_mode),
        .new_fifo_input(new_fifo_input),
        .fifo_output(fifo_output),
        .data_count(data_count),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty)
    );
    
    accumulator total_novelty(
        .clk(clk),
        .rst(rst),
        .new_addition,
        .accumulate,
        .sign,
        .accumulated
    );
    
    accumulator delta_novelty(
        .clk(clk),
        .rst(delta_novelty_reset),
        .new_addition(add_to_delta_novelty),
        .accumulate(dot_out),
        .sign(add_to_delta_novelty_sign),
        .accumulated(accumulated_delta_novelty)
    );

endmodule
 
//module dot_master(
//    input wire clk,
//    input wire reset,
//    input wire start,
//    input wire[4:0] dot_index,
//    input wire op_on_last,
//    input wire include_last,
//    input wire include_first,
//    output reg signed[DOT_PRECISION:0] dot,
//    output reg done,
   
//    input wire[CHROMA_WIDTH:0] fifo_out,
//    output reg[CHROMA_WIDTH:0] fifo_in,
//    output reg fifo_read,
//    output reg fifo_write,
//    input wire fifo_full,
//    input wire fifo_empty,
//    input wire[CHROMA_WIDTH:0] fifo_last,
//    output wire [4:0] focus_index_out,
//    output wire [4:0] cur_index_out,
//    output wire [2:0] state_out,
//    output wire [DOT_PRECISION:0] dot_product_out,
//    output wire [CHROMA_WIDTH:0] focus_chroma_out,
//    output wire [CHROMA_WIDTH:0] fifo_out_out
//    );

        
//    reg[2:0] state;
//    parameter STATE_IDLE = 0;
//    parameter STATE_DELAY_FOCUS = 1;
//    parameter STATE_GET_FOCUS = 2;
//    parameter STATE_DOT = 3;
//    parameter STATE_ADD_LAST = 4;
//    parameter STATE_DONE = 5;
   
//    reg[4:0] focus_index;
//    reg[4:0] cur_index; // Current index read from fifo
//    reg inner_op_on_last;
 
//    reg[CHROMA_WIDTH:0] focus_chroma;
//    reg signed[DOT_PRECISION:0] accum;
//    wire[DOT_PRECISION:0] dot_product;
   
//    dot_engine d(
//        .dot_a(focus_chroma),
//        .dot_b(fifo_out),
//        .out(dot_product)
//    );
   
//    always @(posedge clk) begin
//        if (reset) state <= STATE_IDLE;
       
//        case (state)
//            STATE_IDLE: begin
//                // Reset all variables
//                cur_index <= 31;
//                done <= 0;
//                accum <= 0;
               
//                // On start, save variables and up state
//                if (start) begin
//                    state <= STATE_DELAY_FOCUS;
//                    focus_index <= dot_index;
//                    inner_op_on_last <= op_on_last;
//                    fifo_read <= 1; // Tell the Fifo to pulse read
//                end
               
//            end
            
//            STATE_DELAY_FOCUS: begin
//                if (inner_op_on_last) begin
//                    state <= STATE_DOT;
//                    focus_chroma <= fifo_last;
//                end else state <= STATE_GET_FOCUS;
//            end
           
//            STATE_GET_FOCUS: begin
//                // Our goal is to cycle through the fifo to get the focus_chroma,
//                // which is the chroma with cur_index == focus_index.
//                if (focus_index == cur_index) focus_chroma <= fifo_out;
               
//                // Stop reading once we've cycled through, and advance state.
//                if (cur_index == 0) begin
//                    state <= STATE_DOT;
//                    cur_index <= 31;
//                end else cur_index <= cur_index - 1;
               
//                // Cycle back into the fifo.
//                fifo_write <= 1;
//                fifo_in <= fifo_out;
               
//            end
           
//            STATE_DOT: begin
//                // We now have our focus_chroma at focus_index.
//                // Our goal is to dot focus_chroma will all other chromas (except for itself
//                // or the last index if include_last is false), and either add or subtract that sum
//                // from accum.  We should be careful not to have integer underflows.
               
//                // Note that we will continue to cycle through, as we are still fifo_reading and fifo_writing.
               
//                // Only include last if told to do so, and only include first if told to do so.
//                if (include_first || cur_index != 0) begin
//                    // We have already computed dot_product between the current index and focus index
//                    // using the dot engine module.
                   
//                    // If both indexes are <= 15 or both > 15, add.  Otherwise, subtract.
//                    // This is an implicit application of the checkerboard kernel.
//                    if (op_on_last) begin
//                        if (cur_index > 16) accum <= accum + $signed({1'b0, dot_product});
//                        else accum <= accum - $signed({1'b0, dot_product});
//                    end
//                    else if (cur_index != focus_index) begin
//                        if ((cur_index <= 15 && focus_index <= 15) || (cur_index > 15 && focus_index > 15)) begin
//                            accum <= accum + $signed({1'b0, dot_product});
//                        end else accum <= accum - $signed({1'b0, dot_product});
//                    end
//                end
               
//                // After last element, advance state and halt pulling off loop
//                if (cur_index == 1) fifo_read <= 0;
//                if (cur_index == 0) begin
//                    state <= STATE_DONE;
//                end else
               
//                // Cycle fifo
//                fifo_write <= 1;
//                fifo_in <= fifo_out;
//                cur_index <= cur_index - 1;
//            end
           
//            STATE_DONE: begin
//                // Stop pushing onto fifo
//                fifo_write <= 0;
               
//                // Notify new results
//                dot <= accum;
//                done <= 1;
               
//                // Go to idle state
//                state <= STATE_IDLE;
//            end
           
//            default: state <= STATE_IDLE;
//        endcase
//    end
//    assign focus_index_out = focus_index;
//    assign cur_index_out = cur_index;
//    assign state_out = state;
//    assign dot_product_out = dot_product;
//    assign focus_chroma_out = focus_chroma;
//    assign fifo_out_out = fifo_out;
//endmodule
 

//module novelty(
//    input wire[CHROMA_WIDTH:0] chroma_in,
//    input wire new_chroma,
//    input wire clk,
//    input wire reset,
   
//    output reg new_peak,
//    output reg peak,
//    output reg signed[DOT_PRECISION:0] mid_novelty,
//    output wire [4:0] focus_index_out,
//    output wire [4:0] cur_index_out,
//    output wire [2:0] dot_master_state_out,
//    output wire [DOT_PRECISION:0] dot_product_out,
//    output wire [CHROMA_WIDTH:0] focus_chroma_out,
//    output wire [CHROMA_WIDTH:0] fifo_out_out,
//    output wire [4:0] data_count,
//    output wire fifo_full
//    );
   
//    reg[CHROMA_WIDTH:0] fifo_in_novelty;
//    wire[CHROMA_WIDTH:0] fifo_in_dot;
//    reg fifo_write_novelty, fifo_read_novelty;
//    wire fifo_write_dot, fifo_read_dot;
   
//    wire[CHROMA_WIDTH:0] fifo_out;
//    reg[CHROMA_WIDTH:0] fifo_last;
//    wire fifo_empty;
   
//    reg fifo_control;
//    parameter NOVELTY_CONTROL = 1;
//    parameter DOT_CONTROL = 0;
//    wire [CHROMA_WIDTH:0] fifo_in = fifo_control ? fifo_in_novelty : fifo_in_dot;
//    wire fifo_write = fifo_control ? fifo_write_novelty : fifo_write_dot;
//    wire fifo_read = fifo_full ? (fifo_control ? fifo_read_novelty : fifo_read_dot) : 0;
   
//    chroma_fifo c (
//      .srst(reset),
//      .clk(clk),
//      .din(fifo_in),
//      .wr_en(fifo_write),
//      .rd_en(fifo_read),
//      .dout(fifo_out),  
//      .full(fifo_full),
//      .empty(fifo_empty),
//      .data_count(data_count)
//    );
 
//    reg dot_start, dot_include_last, dot_include_first;
//    reg[4:0] dot_index;
//    wire signed[DOT_PRECISION:0] dot_out;
//    wire dot_done;
//    reg fifo_op_on_last;
   
//    dot_master d (
//        .clk(clk),
//        .reset(reset),
//        .start(dot_start),
//        .dot_index(dot_index),
//        .include_last(dot_include_last),
//        .include_first(dot_include_first),
//        .dot(dot_out),
//        .done(dot_done),
       
//        .fifo_out(fifo_out),
//        .fifo_in(fifo_in_dot),
//        .fifo_read(fifo_read_dot),
//        .fifo_write(fifo_write_dot),
//        .fifo_full(fifo_full),
//        .fifo_empty(fifo_empty),
        
//        .fifo_last(fifo_last),
//        .op_on_last(fifo_op_on_last),
//        .focus_index_out(focus_index_out),
//        .cur_index_out(cur_index_out),
//        .state_out(dot_master_state_out),
//        .dot_product_out(dot_product_out),
//        .focus_chroma_out(focus_chroma_out),
//        .fifo_out_out(fifo_out_out)
//    );
   
//    reg[2:0] state = 0;
   
//    parameter STATE_IDLE = 0;
//    parameter STATE_GET_LAST = 6;
//    parameter STATE_START_FIRST = 1;
//    parameter STATE_END_FIRST = 2;
//    parameter STATE_END_MIDDLE = 3;
//    parameter STATE_END_LAST = 4;
//    parameter STATE_DONE = 5;
   
//    reg signed[DOT_PRECISION:0] new_novelty = 0;
//    //reg signed[DOT_PRECISION:0] mid_novelty = 0;
//    reg signed[DOT_PRECISION:0] old_novelty = 0;
   
//    always @(posedge clk) begin
//        if (reset) begin
//            state <= STATE_IDLE;
//            dot_start <= 0;
//            fifo_op_on_last <= 0;
//            fifo_control <= NOVELTY_CONTROL;
//            new_peak <= 0;
//            fifo_write_novelty <= 0;
//            fifo_read_novelty <= 0;
//        end
//        case (state)
//            STATE_IDLE: begin
//                dot_start <= 0;
//                fifo_op_on_last <= 0;
//                fifo_control <= NOVELTY_CONTROL;
//                new_peak <= 0;
//                fifo_write_novelty <= 0;
                
               
//                // On receiving a new chromogram, push it into the Fifo,
//                // then start the state machine.
//                if (new_chroma) begin
//                    // Push chroma into fifo
//                    fifo_in_novelty <= chroma_in;
//                    fifo_read_novelty <= 1;
                   
//                    // Transition to new state
//                    state <= STATE_GET_LAST;
//                end
//                else begin
//                    fifo_read_novelty <= 0;
//                end
               
//            end
            
//            STATE_GET_LAST: begin
//                fifo_write_novelty <= 1;
//                fifo_read_novelty <= 0;
//                state <= STATE_START_FIRST;
//            end
           
//            STATE_START_FIRST: begin
//                fifo_write_novelty <= 0;
//                fifo_last <= fifo_out;
//                fifo_control <= DOT_CONTROL; // Release fifo control to dot product
               
//                // Start dot product on first element, don't include last, include first
//                dot_start <= 1;
//                dot_index <= 0;
//                dot_include_last <= 0;
//                dot_include_first <= 1;
               
//                // Move to waiting state.
//                state <= STATE_END_FIRST;
//            end
           
//            STATE_END_FIRST: begin
                           
//                // Wait for dot product to be complete
//                if (dot_done) begin
//                    // Add to novelty
//                    new_novelty <= new_novelty + dot_out;
                   
//                    // Enqueue next dot product, and wait for it
//                    dot_start <= 1;
//                    dot_index <= 16; // middle value, previously misclassified
//                    dot_include_first <= 0; // don't include first, as this is correction
//                    dot_include_last <= 0; // do not include last, as correction
                   
//                    // Move to waiting state
//                    state <= STATE_END_MIDDLE;
//                end else dot_start <= 0;
               
//            end
           
//            STATE_END_MIDDLE: begin
               
//                // Wait for dot product to be complete
//                if (dot_done) begin
//                    // Add to novelty twice
//                    new_novelty <= new_novelty + (2*dot_out);
                               
//                    // Enqueue last dot product, and wait for it
//                    dot_start <= 1;
//                    fifo_op_on_last <= 1; // last value, need to subtract
//                    dot_include_first <= 0; // don't include first, as this is correction
//                    dot_include_last <= 1; // do include last, as correction
                               
//                    // Move to waiting state
//                    state <= STATE_END_LAST;
//                end else dot_start <= 0;    
           
//            end
           
//            STATE_END_LAST: begin
//                dot_start <= 0;
                
//                // Wait for dot product to be complete
//                if (dot_done) begin
//                    // Subtract from novelty
//                    new_novelty <= new_novelty - dot_out;
                                       
//                    // Advance to new state                        
//                    state <= STATE_DONE;
//                end    
//            end
           
//            STATE_DONE: begin
               
//                // Now, we have an updated novelty value!
//                // We also have the last two novelties in mid_novelty and old_novelty.
//                // We can use this to compute whether or not we are at a peak.
//                peak <= new_novelty < mid_novelty && old_novelty < mid_novelty && mid_novelty > PEAK_THRESHOLD;
//                new_peak <= 1;
               
//                // We will also update our novelties.
//                old_novelty <= mid_novelty;
//                mid_novelty <= new_novelty;
               
//                // Finally, we'll return control of the fifo, and go back to the idle state.
//                fifo_control <= NOVELTY_CONTROL;
//                state <= STATE_IDLE;
 
//            end
           
//            default: state <= STATE_IDLE;
//        endcase
//    end
   
//endmodule
