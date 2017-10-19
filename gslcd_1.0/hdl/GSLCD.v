// Generator : SpinalHDL v0.10.15    git head : b2cc963be712aa10e43c07c8c2d261d3433a28ef
// Date      : 18/10/2017, 17:24:46
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
  input   io_enable,
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
  wire  _12;
  wire  _13;
  wire  _14;
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
  assign _12 = 1'b0;
  assign _13 = 1'b1;
  assign _14 = 1'b0;
  always @ (io_enable or line or _8 or _9 or _13)
  begin
    if(io_enable)begin
      if((((10'b0000001101) <= line) && (line < (10'b0000010000))))begin
        io_vsync = _8;
      end else begin
        io_vsync = _9;
      end
    end else begin
      io_vsync = _13;
    end
  end

  always @ (io_enable or pixel or _6 or _7 or _14)
  begin
    if(io_enable)begin
      if((((10'b0000101000) <= pixel) && (pixel < (10'b0001011000))))begin
        io_hsync = _6;
      end else begin
        io_hsync = _7;
      end
    end else begin
      io_hsync = _14;
    end
  end

  always @ (io_enable or line or pixel or _10 or _11 or _12)
  begin
    if(io_enable)begin
      if((((10'b0000101101) <= line) && ((10'b0010000000) <= pixel)))begin
        io_active = _10;
      end else begin
        io_active = _11;
      end
    end else begin
      io_active = _12;
    end
  end

  always @ (posedge pclk_clk or posedge pclk_reset)
  begin
    if (pclk_reset) begin
      line <= (10'b0000000000);
      pixel <= (10'b0000000000);
    end else begin
      if(io_enable)begin
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
      end else begin
        line <= (10'b0000000000);
        pixel <= (10'b0000000000);
      end
    end
  end

endmodule

module BufferCC_1
( 
  input   io_dataIn,
  output  io_dataOut,
  input   pclk_clk 
);

  reg  buffers_0;
  reg  buffers_1;
  assign io_dataOut = buffers_1;
  always @ (posedge pclk_clk)
  begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule

module GSLCD
( 
  input   io_slaveBus_aw_valid,
  output  io_slaveBus_aw_ready,
  input  [31:0] io_slaveBus_aw_payload_addr,
  input  [2:0] io_slaveBus_aw_payload_prot,
  input   io_slaveBus_w_valid,
  output  io_slaveBus_w_ready,
  input  [31:0] io_slaveBus_w_payload_data,
  input  [3:0] io_slaveBus_w_payload_strb,
  output  io_slaveBus_b_valid,
  input   io_slaveBus_b_ready,
  output reg [1:0] io_slaveBus_b_payload_resp,
  input   io_slaveBus_ar_valid,
  output  io_slaveBus_ar_ready,
  input  [31:0] io_slaveBus_ar_payload_addr,
  input  [2:0] io_slaveBus_ar_payload_prot,
  output  io_slaveBus_r_valid,
  input   io_slaveBus_r_ready,
  output [31:0] io_slaveBus_r_payload_data,
  output [1:0] io_slaveBus_r_payload_resp,
  input   io_pclk,
  output  io_den,
  output  io_vsync,
  output  io_hsync,
  output [23:0] io_data,
  input   reset,
  input   clk 
);

  wire  slaveBusCtrl_writeJoinEvent_valid;
  wire  slaveBusCtrl_writeJoinEvent_ready;
  wire  _1;
  wire [1:0] slaveBusCtrl_writeRsp_resp;
  wire  _2;
  reg  _3;
  wire  _4;
  wire  _5;
  reg  slaveBusCtrl_readDataStage_valid;
  wire  slaveBusCtrl_readDataStage_ready;
  wire [31:0] slaveBusCtrl_readDataStage_payload_addr;
  wire  _6;
  reg [31:0] _7;
  wire  _8;
  reg [31:0] slaveBusCtrl_readRsp_data;
  wire [1:0] slaveBusCtrl_readRsp_resp;
  wire [1:0] _9;
  wire [1:0] _10;
  reg [0:0] slaveReg1;
  wire [0:0] _11;
  wire  enable;
  wire  pclk_clk;
  wire  pclk_reset;
  wire  _12;
  wire  _13;
  wire [23:0] _14;
  wire  _15;
  wire  _16;
  BufferCC bufferCC_2 ( 
    .io_initial(_13),
    .io_dataIn(_12),
    .io_dataOut(pclk_reset),
    .pclk_clk(pclk_clk),
    .reset(reset) 
  );
  GSLCDTiming pixelClockArea_timing ( 
    .io_enable(_15),
    .io_vsync(io_vsync),
    .io_hsync(io_hsync),
    .io_active(io_den),
    .pclk_clk(pclk_clk),
    .pclk_reset(pclk_reset) 
  );
  BufferCC_1 bufferCC_3 ( 
    .io_dataIn(enable),
    .io_dataOut(_15),
    .pclk_clk(pclk_clk) 
  );
  assign io_slaveBus_aw_ready = _1;
  assign io_slaveBus_w_ready = _1;
  assign io_slaveBus_b_valid = _3;
  assign io_slaveBus_ar_ready = _16;
  assign io_slaveBus_r_valid = slaveBusCtrl_readDataStage_valid;
  assign io_slaveBus_r_payload_data = slaveBusCtrl_readRsp_data;
  assign io_slaveBus_r_payload_resp = slaveBusCtrl_readRsp_resp;
  assign io_data = _14;
  assign slaveBusCtrl_writeJoinEvent_valid = (io_slaveBus_aw_valid && io_slaveBus_w_valid);
  assign slaveBusCtrl_writeJoinEvent_ready = _2;
  assign _1 = (slaveBusCtrl_writeJoinEvent_valid && slaveBusCtrl_writeJoinEvent_ready);
  assign slaveBusCtrl_writeRsp_resp = _9;
  assign _2 = ((_5 && (! _3)) || io_slaveBus_b_ready);
  assign _4 = 1'b0;
  assign _5 = 1'b1;
  assign slaveBusCtrl_readDataStage_ready = io_slaveBus_r_ready;
  assign slaveBusCtrl_readDataStage_payload_addr = _7;
  assign _6 = 1'b0;
  assign _8 = 1'b1;
  assign slaveBusCtrl_readRsp_resp = _10;
  assign _9 = (2'b00);
  assign _10 = (2'b00);
  assign _11 = (1'b0);
  assign enable = slaveReg1[0];
  assign pclk_clk = io_pclk;
  assign _12 = 1'b0;
  assign _13 = 1'b1;
  assign _14 = (24'b111111110000000000000000);
  assign _16 = ((_8 && (! slaveBusCtrl_readDataStage_valid)) || slaveBusCtrl_readDataStage_ready);
  always @ (slaveBusCtrl_readDataStage_payload_addr or slaveReg1)
  begin
    slaveBusCtrl_readRsp_data = (32'b00000000000000000000000000000000);
    if((slaveBusCtrl_readDataStage_payload_addr == (32'b00000000000000000000000000000000)))begin
      slaveBusCtrl_readRsp_data[0 : 0] = slaveReg1;
    end
  end

  always @ (posedge clk or posedge reset)
  begin
    if (reset) begin
      _3 <= _4;
      slaveBusCtrl_readDataStage_valid <= _6;
      slaveReg1 <= _11;
    end else begin
      if(_2)begin
        _3 <= slaveBusCtrl_writeJoinEvent_valid;
      end
      if(_16)begin
        slaveBusCtrl_readDataStage_valid <= io_slaveBus_ar_valid;
      end
      if((io_slaveBus_aw_payload_addr == (32'b00000000000000000000000000000000)))begin
        if((slaveBusCtrl_writeJoinEvent_valid && slaveBusCtrl_writeJoinEvent_ready))begin
          slaveReg1 <= io_slaveBus_w_payload_data[0 : 0];
        end
      end
    end
  end

  always @ (posedge clk)
  begin
    if(_2)begin
      io_slaveBus_b_payload_resp <= slaveBusCtrl_writeRsp_resp;
    end
    if(_16)begin
      _7 <= io_slaveBus_ar_payload_addr;
    end
  end

endmodule

