`timescale 1ns / 1ps

module gslcd_v1_0_timing_tb();

// localparams for the LCD
localparam integer C_FRAME_WIDTH = 800;
localparam integer C_FRAME_HEIGHT = 480;
localparam integer C_LCD_LINE_REG_WIDTH = 10;
localparam integer C_LCD_PIXEL_REG_WIDTH = 10;
localparam integer C_LCD_LINES = 525;
localparam integer C_LCD_VSYNC_START = 13;
localparam integer C_LCD_VSYNC_END = 16;
localparam integer C_LCD_VACTIVE_START = 45;
localparam integer C_LCD_HPIXELS = 928;
localparam integer C_LCD_HSYNC_START = 40;
localparam integer C_LCD_HSYNC_END = 88;
localparam integer C_LCD_HACTIVE_START = 128;

reg clk = 0;
wire vsync;
wire hsync;
wire active;
wire frame_start;

always begin
    #5 clk = ! clk;
end

gslcd_v1_0_timing # (
  .C_LCD_LINE_REG_WIDTH(C_LCD_LINE_REG_WIDTH),
  .C_LCD_PIXEL_REG_WIDTH(C_LCD_PIXEL_REG_WIDTH),
  .C_LCD_LINES(C_LCD_LINES),
  .C_LCD_VSYNC_START(C_LCD_VSYNC_START),
  .C_LCD_VSYNC_END(C_LCD_VSYNC_END),
  .C_LCD_VACTIVE_START(C_LCD_VACTIVE_START),
  .C_LCD_HPIXELS(C_LCD_HPIXELS),
  .C_LCD_HSYNC_START(C_LCD_HSYNC_START),
  .C_LCD_HSYNC_END(C_LCD_HSYNC_END),
  .C_LCD_HACTIVE_START(C_LCD_HACTIVE_START)
) gslcd_v1_0_timing_inst (
  .PCLK(clk),
  .EN(1'b1),
  .VSYNC(vsync),
  .HSYNC(hsync),
  .ACTIVE(active),
  .FRAME_START(frame_start)
);

endmodule
