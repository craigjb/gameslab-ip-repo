`timescale 1ns / 1ps

module gslcd_v1_0_timing_tb();

reg reset = 1;
reg clk = 0;
reg enable = 0;
wire vsync;
wire hsync;
wire active;

always begin
    #5 clk = ! clk;
end

initial begin
    reset = 1;
    #15;
    reset = 0;
    #10;
    enable = 1;
end

GSLCDTiming gslcd_v1_0_timing_inst (
  .pclk_clk(clk),
  .pclk_reset(reset),
  .io_enable(enable),
  .io_vsync(vsync),
  .io_hsync(hsync),
  .io_active(active)
);

endmodule
