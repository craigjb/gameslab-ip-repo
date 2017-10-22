`timescale 1ns / 1ps

module gslcd_tb();

    reg AXI_CLK = 0;
    reg LCD_PCLK = 0;

    localparam integer TEST_PAT = 24'habcdef;

    localparam integer C_S00_AXI_DATA_WIDTH	= 32;
    localparam integer C_S00_AXI_ADDR_WIDTH	= 32;
    localparam integer C_M00_AXI_BURST_LEN	= 16;
    localparam integer C_M00_AXI_ID_WIDTH	= 1;
    localparam integer C_M00_AXI_ADDR_WIDTH	= 32;
    localparam integer C_M00_AXI_DATA_WIDTH	= 32;
    localparam integer C_M00_AXI_AWUSER_WIDTH	= 0;
    localparam integer C_M00_AXI_ARUSER_WIDTH	= 0;
    localparam integer C_M00_AXI_WUSER_WIDTH	= 0;
    localparam integer C_M00_AXI_RUSER_WIDTH	= 0;
    localparam integer C_M00_AXI_BUSER_WIDTH	= 0;

    wire LCD_DEN;
    wire LCD_VSYNC;
    wire LCD_HSYNC;
    wire [23 : 0] LCD_DATA;

    // Ports of Axi Slave Bus Interface S00_AXI
    wire  s00_axi_aclk = AXI_CLK;
    reg  s00_axi_aresetn = 0;
    wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr = 0;
    wire [2 : 0] s00_axi_awprot = 0;
    reg  s00_axi_awvalid = 0;
    wire  s00_axi_awready;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata = 1;
    wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb = 4'b1111;
    reg  s00_axi_wvalid = 0;
    wire  s00_axi_wready;
    wire [1 : 0] s00_axi_bresp;
    wire  s00_axi_bvalid;
    wire  s00_axi_bready = s00_axi_bvalid;
    wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr = 0;
    wire [2 : 0] s00_axi_arprot = 0;
    wire  s00_axi_arvalid = 0;
    wire  s00_axi_arready;
    wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata;
    wire [1 : 0] s00_axi_rresp;
    wire  s00_axi_rvalid;
    wire  s00_axi_rready = 0;

    // Ports of Axi Master Bus Interface M00_AXI
    wire  m00_axi_aclk = AXI_CLK;
    wire  m00_axi_aresetn = 1;
    wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_awid;
    wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_awaddr;
    wire [7 : 0] m00_axi_awlen;
    wire [2 : 0] m00_axi_awsize;
    wire [1 : 0] m00_axi_awburst;
    wire  m00_axi_awlock;
    wire [3 : 0] m00_axi_awcache;
    wire [2 : 0] m00_axi_awprot;
    wire [3 : 0] m00_axi_awqos;
    wire [C_M00_AXI_AWUSER_WIDTH-1 : 0] m00_axi_awuser;
    wire  m00_axi_awvalid;
    wire  m00_axi_awready = 0;
    wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_wdata;
    wire [C_M00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_wstrb;
    wire  m00_axi_wlast;
    wire [C_M00_AXI_WUSER_WIDTH-1 : 0] m00_axi_wuser;
    wire  m00_axi_wvalid;
    wire  m00_axi_wready = 0;
    wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_bid = 0;
    wire [1 : 0] m00_axi_bresp = 0;
    wire [C_M00_AXI_BUSER_WIDTH-1 : 0] m00_axi_buser = 0;
    wire  m00_axi_bvalid;
    wire  m00_axi_bready;
    wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_arid;
    wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_araddr;
    wire [7 : 0] m00_axi_arlen;
    wire [2 : 0] m00_axi_arsize;
    wire [1 : 0] m00_axi_arburst;
    wire  m00_axi_arlock;
    wire [3 : 0] m00_axi_arcache;
    wire [2 : 0] m00_axi_arprot;
    wire [3 : 0] m00_axi_arqos;
    wire [C_M00_AXI_ARUSER_WIDTH-1 : 0] m00_axi_aruser;
    wire  m00_axi_arvalid;
    reg  m00_axi_arready = 1;
    wire [C_M00_AXI_ID_WIDTH-1 : 0] m00_axi_rid = 0;
    reg [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_rdata = 0;
    wire [1 : 0] m00_axi_rresp = 0;
    reg  m00_axi_rlast = 0;
    wire [C_M00_AXI_RUSER_WIDTH-1 : 0] m00_axi_ruser = 0;
    reg  m00_axi_rvalid = 0;
    wire  m00_axi_rready;

    always begin
        #10 AXI_CLK = 1; #10 AXI_CLK = 0;
    end

    always begin
        #30 LCD_PCLK = 1; #30 LCD_PCLK = 0;
    end

    integer i;
    integer off;
    integer len;
    integer memaddr;
    reg [7:0] mem [0:(800*480*3)];

    initial begin
        for (i = 0; i < (800 * 480); i = i + 1) begin
            mem[i*3] = i[7:0];
            mem[(i*3)+1] = i[15:8];
            mem[(i*3)+2] = i[23:16];
        end

        #45;
        s00_axi_aresetn = 1;
        #15;
        #60;

        #5;
        s00_axi_awvalid = 1;
        s00_axi_wvalid = 1;
        #40;
        s00_axi_awvalid = 0;
        s00_axi_wvalid = 0;

        while (s00_axi_bvalid == 0) begin
            #20;
        end

        while (1) begin
            while (m00_axi_arvalid == 0) begin
                #20;
            end
            off = m00_axi_araddr;
            len = m00_axi_arlen;
            #100;
            for (i = 0; i <= len; i = i + 1) begin
                m00_axi_rdata[7:0] <= mem[off + (i * 4) + 0];
                m00_axi_rdata[15:8] <= mem[off + (i * 4) + 1];
                m00_axi_rdata[23:16] <= mem[off + (i * 4) + 2];
                m00_axi_rdata[31:24] <= mem[off + (i * 4) + 3];
                m00_axi_rvalid = 1;
                if (i == len)
                    m00_axi_rlast = 1;
                else
                    m00_axi_rlast = 0;
                #20;
            end
            m00_axi_rdata = 0;
            m00_axi_rvalid = 0;
            m00_axi_rlast = 0;
        end
    end

    gslcd_v1_0 dut (
        // Ports of the LCD
        .LCD_PCLK(LCD_PCLK),
        .LCD_DEN(LCD_DEN),
        .LCD_VSYNC(LCD_VSYNC),
        .LCD_HSYNC(LCD_HSYNC),
        .LCD_DATA(LCD_DATA),

        // Ports of Axi Slave Bus Interface S00_AXI
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awprot(s00_axi_awprot),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_bresp(s00_axi_bresp),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_arprot(s00_axi_arprot),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rresp(s00_axi_rresp),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_rready(s00_axi_rready),

        // Ports of Axi Master Bus Interface M00_AXI
        .m00_axi_aclk(m00_axi_aclk),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_awid(m00_axi_awid),
        .m00_axi_awaddr(m00_axi_awaddr),
        .m00_axi_awlen(m00_axi_awlen),
        .m00_axi_awsize(m00_axi_awsize),
        .m00_axi_awburst(m00_axi_awburst),
        .m00_axi_awlock(m00_axi_awlock),
        .m00_axi_awcache(m00_axi_awcache),
        .m00_axi_awprot(m00_axi_awprot),
        .m00_axi_awqos(m00_axi_awqos),
        .m00_axi_awuser(m00_axi_awuser),
        .m00_axi_awvalid(m00_axi_awvalid),
        .m00_axi_awready(m00_axi_awready),
        .m00_axi_wdata(m00_axi_wdata),
        .m00_axi_wstrb(m00_axi_wstrb),
        .m00_axi_wlast(m00_axi_wlast),
        .m00_axi_wuser(m00_axi_wuser),
        .m00_axi_wvalid(m00_axi_wvalid),
        .m00_axi_wready(m00_axi_wready),
        .m00_axi_bid(m00_axi_bid),
        .m00_axi_bresp(m00_axi_bresp),
        .m00_axi_buser(m00_axi_buser),
        .m00_axi_bvalid(m00_axi_bvalid),
        .m00_axi_bready(m00_axi_bready),
        .m00_axi_arid(m00_axi_arid),
        .m00_axi_araddr(m00_axi_araddr),
        .m00_axi_arlen(m00_axi_arlen),
        .m00_axi_arsize(m00_axi_arsize),
        .m00_axi_arburst(m00_axi_arburst),
        .m00_axi_arlock(m00_axi_arlock),
        .m00_axi_arcache(m00_axi_arcache),
        .m00_axi_arprot(m00_axi_arprot),
        .m00_axi_arqos(m00_axi_arqos),
        .m00_axi_aruser(m00_axi_aruser),
        .m00_axi_arvalid(m00_axi_arvalid),
        .m00_axi_arready(m00_axi_arready),
        .m00_axi_rid(m00_axi_rid),
        .m00_axi_rdata(m00_axi_rdata),
        .m00_axi_rresp(m00_axi_rresp),
        .m00_axi_rlast(m00_axi_rlast),
        .m00_axi_ruser(m00_axi_ruser),
        .m00_axi_rvalid(m00_axi_rvalid),
        .m00_axi_rready(m00_axi_rready)
    );

endmodule
