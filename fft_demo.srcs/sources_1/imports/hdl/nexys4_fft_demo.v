`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mitchell Gu
// Project Name: Nexys4 FFT Demo
//////////////////////////////////////////////////////////////////////////////////

module nexys4_fft_demo (
    input wire CLK100MHZ,
    input wire [15:0] SW, 
    input wire BTNC, BTNU, BTNL, BTNR, BTND,
    input wire AD3P, AD3N,  // The top pair of ports on JXADC on Nexys 4
    output wire [3:0] VGA_R, 
    output wire [3:0] VGA_B, 
    output wire [3:0] VGA_G,
    output wire VGA_HS, 
    output wire VGA_VS, 
    output wire AUD_PWM, AUD_SD,
    output wire LED16_B, LED16_G, LED16_R,
    output wire LED17_B, LED17_G, LED17_R,
    output wire [15:0] LED, // LEDs above switches
    output wire [7:0] SEG,  // segments A-G (0-6), DP (7)
    output wire [7:0] AN    // Display 0-7
    );

    // SETUP CLOCKS
    // 104Mhz clock for XADC and primary clock domain
    // It divides by 4 and runs the ADC clock at 26Mhz
    // And the ADC can do one conversion in 26 clock cycles
    // So the sample rate is 1Msps (not posssible w/ 100Mhz)
    // 65Mhz for VGA Video
    wire clk_104mhz, clk_65mhz, clk_208mhz;
    clk_wiz_0 clockgen(
        .clk_in1(CLK100MHZ),
        .clk_out1(clk_104mhz),
        .clk_out2(clk_65mhz),
        .clk_out3(clk_208mhz));

    // INSTANTIATE XVGA SIGNALS (1024x768)
    wire [10:0] hcount;
    wire [9:0] vcount;
    wire hsync, vsync, blank;
    xvga xvga1(
        .vclock(clk_65mhz),
        .hcount(hcount),
        .vcount(vcount),
        .vsync(vsync),
        .hsync(hsync),
        .blank(blank));

// **************** BEGIN BASIC IO SETUP *******************************//

    wire[43:0] mid_novelty;

    // INSTANTIATE SEVEN SEGMENT DISPLAY
    display_8hex display(
        .clk(clk_65mhz),
        .data(mid_novelty[31:0]),
        .seg(SEG[6:0]),
        .strobe(AN));
    assign SEG[7] = 1; 

    // Parametrized debounce module to do all 16 switches and 5 buttons
    wire BTNC_clean, BTNU_clean, BTND_clean, BTNL_clean, BTNR_clean;
    wire [15:0] SW_clean;
    debounce #(.COUNT(21)) db0 (
        .clk(clk_104mhz),
        .reset(1'b0),
        .noisy({SW, BTNC, BTNU, BTND, BTNL, BTNR}),
        .clean({SW_clean, BTNC_clean, BTNU_clean, BTND_clean, BTNL_clean, BTNR_clean}));


// **************** END BASIC IO SETUP *******************************//

    wire [15:0] sample_reg;
    wire eoc, xadc_reset;
    // INSTANTIATE XADC IP
    xadc_demo xadc_demo (
        .dclk_in(clk_104mhz),  // Master clock for DRP and XADC. 
        .di_in(0),             // DRP input info (0 becuase we don't need to write)
        .daddr_in(6'h13),      // The DRP register address for the third analog input register
        .den_in(1),            // DRP enable line high (we want to read)
        .dwe_in(0),            // DRP write enable low (never write)
        .drdy_out(),           // DRP ready signal (unused)
        .do_out(sample_reg),   // DRP output from register (the ADC data)
        .reset_in(xadc_reset), // reset line
        .vp_in(0),             // dedicated/built in analog channel on bank 0
        .vn_in(0),             // can't use this analog channel b/c of nexys 4 setup
        .vauxp3(AD3P),         // The third analog auxiliary input channel
        .vauxn3(AD3N),         // Choose this one b/c it's on JXADC header 1
        .channel_out(),        // Not useful in sngle channel mode
        .eoc_out(eoc),         // Pulses high on end of ADC conversion
        .alarm_out(),          // Not useful
        .eos_out(),            // End of sequence pulse, not useful
        .busy_out()            // High when conversion is in progress. unused.
    );
    assign xadc_reset = BTNC_clean;

    // INSTANTIATE 64x OVERSAMPLING
    // This outputs 15-bit samples at a 62.5/4kHz sample rate
    // (3 more bits, 1/64 the sample rate)
    wire [14:0] osample64;
    reg [14:0] prev_osample64;
    reg [14:0] prev_prev_osample64;
    wire done_osample64;
    reg prev_done_osample64;
    reg prev_prev_done_osample64;
    oversample64 osamp64_1 (
        .clk(clk_104mhz),
        .sample(sample_reg[15:4]),
        .eoc(eoc),
        .oversample(osample64),
        .done(done_osample64));
    
    always @ (posedge clk_104mhz) begin
        prev_osample64 <= osample64;
        prev_prev_osample64 <= prev_osample64;
        prev_done_osample64 <= done_osample64;
        prev_prev_done_osample64 <= prev_done_osample64;
    end
    // INSTANTIATE SAMPLE FRAME BLOCK RAM 
    // This 16x4096 bram stores the frame of samples
    // The write port is written by osample64.
    // The read port is read by the bram_to_fft module and sent to the fft.
    wire fwe;
    reg [11:0] fhead = 0; // Frame head - a pointer to the write point, works as circular buffer
    reg [11:0] prev_fhead;
    reg [11:0] prev_prev_fhead;
    wire [15:0] fsample;  // The sample data from the XADC, oversampled 16x
    wire [15:0] fsample_regular;
    wire [15:0] fsample_hanning;
    wire [11:0] faddr;    // Frame address - The read address, controlled by bram_to_fft
    wire [15:0] fdata;    // Frame data - The read data, input into bram_to_fft
    wire [11:0] fake_index = 200;
    bram_frame bram1 (
        .clka(clk_104mhz),
        .wea(fwe),
        .addra(prev_prev_fhead),
        .dina(fsample),
        .clkb(clk_104mhz),
        .addrb(faddr),
        .doutb(fdata));
        
    wire [15:0] hanning_value;
    hanning hanning_values(
          .clka(clk_104mhz),    // input wire clka
          .ena(1),      // input wire ena
          .addra(fhead),  // input wire [11 : 0] addra
          .douta(hanning_value)  // output wire [15 : 0] douta
        );
        
    // SAMPLE FRAME BRAM WRITE PORT SETUP
    always @(posedge clk_104mhz) begin
        if (done_osample64) fhead <= fhead + 1; // Move the pointer every oversample
        prev_fhead <= fhead;
        prev_prev_fhead <= prev_fhead;
    end
    assign fsample_hanning = ({16'b0, prev_prev_osample64, 1'b0} * {16'b0, hanning_value}) >> 16; // Pad the oversample with zeros to pretend it's 16 bits
    assign fsample_regular = {prev_prev_osample64, 1'b0};
    assign fsample = SW_clean[3] ? fsample_hanning : fsample_regular;
    assign fwe = prev_prev_done_osample64; // Write only when we finish an oversample (every 104*16 clock cycles)

    // SAMPLE FRAME BRAM READ PORT SETUP
    // For this demo, we just need to display the FFT on 60Hz video, so let's only send the frame of samples
    // once every 60Hz. If you want to though, you can send frames much faster, one right after each other.
    // For this 4096pt fully pipelined FFT, the limit is 104Mhz/4096cycles_per_frame = 25kHz (approx)
    // The next two modules just synchronize the 60Hz vsync to the 104Mhz domain and convert it to a 1 cycle pulse.
    wire vsync_104mhz, vsync_104mhz_pulse;
    synchronize vsync_synchronize(
        .clk(clk_104mhz),
        .in(vsync),
        .out(vsync_104mhz));

    level_to_pulse vsync_ltp(
        .clk(clk_104mhz),
        .level(~vsync_104mhz),
        .pulse(vsync_104mhz_pulse));

    // INSTANTIATE BRAM TO FFT MODULE
    // This module handles the magic of reading sample frames from the BRAM whenever start is asserted,
    // and sending it to the FFT block design over the AXI-stream interface.
    wire collected_frame;
    assign collected_frame = prev_prev_done_osample64 && (& prev_prev_fhead);
    wire last_missing; // All these are control lines to the FFT block design
    wire [31:0] frame_tdata;
    wire frame_tlast, frame_tready, frame_tvalid;
    bram_to_fft bram_to_fft_0(
        .clk(clk_104mhz),
        .head(prev_prev_fhead),
        .addr(faddr),
        .data(fdata),
        .start(collected_frame),
        .last_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid)
    );

    // This is the FFT module, implemented as a block design with a 4096pt, 16bit FFT
    // that outputs in magnitude by doing sqrt(Re^2 + Im^2) on the FFT result.
    // It's fully pipelined, so it streams 4096-wide frames of frequency data as fast as
    // you stream in 4096-wide frames of time-domain samples.
    wire [23:0] magnitude_tdata; // This output bus has the FFT magnitude for the current index
    wire [11:0] magnitude_tuser; // This represents the current index being output, from 0 to 4096
    wire [11:0] scale_factor; // This input adjusts the scaling of the FFT, which can be tuned to the input magnitude.
    wire magnitude_tlast, magnitude_tvalid;
    fft_mag fft_mag_i(
        .clk(clk_104mhz),
        .event_tlast_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .scaling(SW_clean[15:4]),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid));
    
    /*ila_0 your_instance_name (
        .clk(clk_208mhz), // input wire clk
    
    
        .probe0(clk_104mhz), // input wire [0:0]  probe0  
        .probe1(hanning_value), // input wire [15:0]  probe1 
        .probe2(prev_prev_osample64), // input wire [14:0]  probe2 
        .probe3(fhead), // input wire [11:0]  probe3 
        .probe4(fsample), // input wire [15:0]  probe4
        .probe5(prev_prev_done_osample64)
    );*/
        
    // Let's only care about the range from index 0 to 1023, which represents frequencies 0 to omega/2
    // where omega is the nyquist frequency (sample rate / 2)
    wire in_range = ~|magnitude_tuser[11:10]; // When 13 and 12 are 0, we're on indexes 0 to 1023

    // INSTANTIATE HISTOGRAM BLOCK RAM 
    // This 16x1024 bram stores the histogram data.
    // The write port is written by process_fft.
    // The read port is read by the video outputter or the SD care saver
    // Assign histogram bram read address to histogram module unless saving
    wire [9:0] haddr; // The read port address
    wire [15:0] hdata; // The read port data
    bram_fft bram2 (
        .clka(clk_104mhz),
        .wea(in_range & magnitude_tvalid),  // Only save FFT output if in range and output is valid
        .addra(magnitude_tuser[9:0]),       // The FFT output index, 0 to 1023
        .dina(magnitude_tdata[15:0]),       // The actual FFT magnitude
        .clkb(clk_65mhz),  // input wire clkb
        .addrb(haddr),     // input wire [9 : 0] addrb
        .doutb(hdata)      // output wire [15 : 0] doutb
    );

    // INSTANTIATE HISTOGRAM VIDEO
    // A simple module that outputs a VGA histogram based on
    // hcount, vcount, and the BRAM read values
    wire [2:0] hist_pixel;
    wire [2:0] chroma_pixel;
    wire [2:0] spec_pixel;
    wire [1:0] hist_range;
    wire[12*16-1:0] chroma;
    //assign chroma = {16'd1,16'd2,16'd4,16'd8,16'd16,16'd32,16'd64,16'd128,16'd256,16'd512,16'd1024,16'd2048};
    chroma_histogram chroma_histogram(
        .clk(clk_65mhz),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank),
        .chroma(chroma),
        .pixel(chroma_pixel));
    histogram histo(
        .clk(clk_65mhz),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank),
        .range(SW_clean[1:0]),
        .vaddr(haddr),
        .vdata(hdata),
        .pixel(spec_pixel));
    assign hist_pixel = SW_clean[2] ? chroma_pixel : spec_pixel;
    // INSTANTIATE PWM AUDIO OUT MODULE
    // 11 bit PWM audio out is reasonable because otherwise, the PWM frequency would
    // drop close to the audible and unfiltered range. 11bits -> 104Mhz/2^11=51Khz
    wire [10:0] pwm_sample;
    pwm11 pwm_out(
        .clk(clk_104mhz),
        .PWM_in(osample64[14:4]),
        .PWM_out(AUD_PWM),
        .PWM_sd(AUD_SD));

    wire chroma_done;
    chroma_calculator chroma_calc1(.clk(clk_104mhz), 
                                    .valid_sample(magnitude_tvalid),
                                    .new_sample_addr(magnitude_tuser),
                                    .new_sample_data(magnitude_tdata[15:0]),
                                    .last_sample(magnitude_tlast),
                                    .chroma(chroma),
                                    .done(chroma_done));
    wire new_peak, peak;
    
    novelty n(.chroma_in(chroma),
              .new_chroma(chroma_done),
              .clk(clk_104mhz),
              .reset(0),
              .new_peak(new_peak),
              .peak(peak),
              .mid_novelty(mid_novelty));

//////////////////////////////////////////////////////////////////////////////////
//  
    // VGA OUTPUT
    // Histogram has two pipeline stages so we'll pipeline the hs and vs accordingly
    reg [1:0] hsync_delay;
    reg [1:0] vsync_delay;
    reg hsync_out, vsync_out;
    always @(posedge clk_65mhz) begin
        {hsync_out,hsync_delay} <= {hsync_delay,hsync};
        {vsync_out,vsync_delay} <= {vsync_delay,vsync};
    end
    assign VGA_R = {4{hist_pixel[0]}};
    assign VGA_G = {4{hist_pixel[1]}};
    assign VGA_B = {4{hist_pixel[2]}};
    assign VGA_HS = hsync_out;
    assign VGA_VS = vsync_out;
    
    // Assign RGB LEDs
    assign {LED16_R, LED16_G, LED16_B} = 3'b000;
    assign {LED17_R, LED17_G, LED17_B} = 3'b000;
    
    // Assign switch LEDs to switch states
    assign LED = SW;
//
//////////////////////////////////////////////////////////////////////////////////
 
endmodule