// Generator : SpinalHDL v0.10.14    git head : 39a6b8a9e29a138ca415488dfdac0410155d25f1
// Date      : 18/10/2017, 16:15:35
// Component : GSLCD


module BufferCC
( 
  input   io_initial,
  input   io_dataIn,
  output  io_dataOut,
  input   pclk_clk,
  input   reset 
);

  reg  buffers_0;
  reg  buffers_1;
  assign io_dataOut = buffers_1;
  always @ (posedge pclk_clk or posedge reset)
  begin
    if (reset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end

endmodule

module GSLCDTiming
( 
  output reg  io_vsync,
  output reg  io_hsync,
  output reg  io_active,
  input   pclk_clk,
  input   pclk_reset 
);

  reg [9:0] line;
  reg [9:0] pixel;
  wire [9:0] _1;
  wire  _2;
  wire [9:0] _3;
  wire [9:0] _4;
  wire [9:0] _5;
  wire  _6;
  wire  _7;
  wire  _8;
  wire  _9;
  wire  _10;
  wire  _11;
  assign _1 = (10'b1110011111);
  assign _2 = (pixel == _1);
  assign _3 = (10'b1000001100);
  assign _4 = (line + (10'b0000000001));
  assign _5 = (pixel + (10'b0000000001));
  assign _6 = 1'b1;
  assign _7 = 1'b0;
  assign _8 = 1'b1;
  assign _9 = 1'b0;
  assign _10 = 1'b1;
  assign _11 = 1'b0;
  always @ (line or _8 or _9)
  begin
    if((((10'b0000001101) <= line) && (line < (10'b0000010000))))begin
      io_vsync = _8;
    end else begin
      io_vsync = _9;
    end
  end

  always @ (pixel or _6 or _7)
  begin
    if((((10'b0000101000) <= pixel) && (pixel < (10'b0001011000))))begin
      io_hsync = _6;
    end else begin
      io_hsync = _7;
    end
  end

  always @ (line or pixel or _10 or _11)
  begin
    if((((10'b0000101101) <= line) && ((10'b0010000000) <= pixel)))begin
      io_active = _10;
    end else begin
      io_active = _11;
    end
  end

  always @ (posedge pclk_clk or posedge pclk_reset)
  begin
    if (pclk_reset) begin
      line <= (10'b0000000000);
      pixel <= (10'b0000000000);
    end else begin
      if(_2)begin
        if((line == _3))begin
          line <= (10'b0000000000);
        end else begin
          line <= _4;
        end
        pixel <= (10'b0000000000);
      end else begin
        line <= line;
        pixel <= _5;
      end
    end
  end

endmodule

module GSLCD
( 
  input   io_pclk,
  output  io_den,
  output  io_vsync,
  output  io_hsync,
  output [23:0] io_data,
  input   reset 
);

  wire  pclk_clk;
  wire  pclk_reset;
  wire  _1;
  wire  _2;
  wire [23:0] _3;
  BufferCC bufferCC_1 ( 
    .io_initial(_2),
    .io_dataIn(_1),
    .io_dataOut(pclk_reset),
    .pclk_clk(pclk_clk),
    .reset(reset) 
  );
  GSLCDTiming pixelClockArea_timing ( 
    .io_vsync(io_vsync),
    .io_hsync(io_hsync),
    .io_active(io_den),
    .pclk_clk(pclk_clk),
    .pclk_reset(pclk_reset) 
  );
  assign io_data = _3;
  assign pclk_clk = io_pclk;
  assign _1 = 1'b0;
  assign _2 = 1'b1;
  assign _3 = (24'b111111110000000000000000);
endmodule

