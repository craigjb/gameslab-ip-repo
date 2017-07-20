# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "LCD Params"

  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Bus Params}]
  ipgui::add_param $IPINST -name "C_S00_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_HIGHADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_FRAME_HEIGHT { PARAM_VALUE.C_FRAME_HEIGHT } {
	# Procedure called to update C_FRAME_HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FRAME_HEIGHT { PARAM_VALUE.C_FRAME_HEIGHT } {
	# Procedure called to validate C_FRAME_HEIGHT
	return true
}

proc update_PARAM_VALUE.C_FRAME_WIDTH { PARAM_VALUE.C_FRAME_WIDTH } {
	# Procedure called to update C_FRAME_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FRAME_WIDTH { PARAM_VALUE.C_FRAME_WIDTH } {
	# Procedure called to validate C_FRAME_WIDTH
	return true
}

proc update_PARAM_VALUE.C_LCD_HACTIVE_START { PARAM_VALUE.C_LCD_HACTIVE_START } {
	# Procedure called to update C_LCD_HACTIVE_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_HACTIVE_START { PARAM_VALUE.C_LCD_HACTIVE_START } {
	# Procedure called to validate C_LCD_HACTIVE_START
	return true
}

proc update_PARAM_VALUE.C_LCD_HPIXELS { PARAM_VALUE.C_LCD_HPIXELS } {
	# Procedure called to update C_LCD_HPIXELS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_HPIXELS { PARAM_VALUE.C_LCD_HPIXELS } {
	# Procedure called to validate C_LCD_HPIXELS
	return true
}

proc update_PARAM_VALUE.C_LCD_HSYNC_END { PARAM_VALUE.C_LCD_HSYNC_END } {
	# Procedure called to update C_LCD_HSYNC_END when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_HSYNC_END { PARAM_VALUE.C_LCD_HSYNC_END } {
	# Procedure called to validate C_LCD_HSYNC_END
	return true
}

proc update_PARAM_VALUE.C_LCD_HSYNC_START { PARAM_VALUE.C_LCD_HSYNC_START } {
	# Procedure called to update C_LCD_HSYNC_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_HSYNC_START { PARAM_VALUE.C_LCD_HSYNC_START } {
	# Procedure called to validate C_LCD_HSYNC_START
	return true
}

proc update_PARAM_VALUE.C_LCD_LINES { PARAM_VALUE.C_LCD_LINES } {
	# Procedure called to update C_LCD_LINES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_LINES { PARAM_VALUE.C_LCD_LINES } {
	# Procedure called to validate C_LCD_LINES
	return true
}

proc update_PARAM_VALUE.C_LCD_LINE_REG_WIDTH { PARAM_VALUE.C_LCD_LINE_REG_WIDTH } {
	# Procedure called to update C_LCD_LINE_REG_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_LINE_REG_WIDTH { PARAM_VALUE.C_LCD_LINE_REG_WIDTH } {
	# Procedure called to validate C_LCD_LINE_REG_WIDTH
	return true
}

proc update_PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH { PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH } {
	# Procedure called to update C_LCD_PIXEL_REG_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH { PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH } {
	# Procedure called to validate C_LCD_PIXEL_REG_WIDTH
	return true
}

proc update_PARAM_VALUE.C_LCD_VACTIVE_START { PARAM_VALUE.C_LCD_VACTIVE_START } {
	# Procedure called to update C_LCD_VACTIVE_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_VACTIVE_START { PARAM_VALUE.C_LCD_VACTIVE_START } {
	# Procedure called to validate C_LCD_VACTIVE_START
	return true
}

proc update_PARAM_VALUE.C_LCD_VSYNC_END { PARAM_VALUE.C_LCD_VSYNC_END } {
	# Procedure called to update C_LCD_VSYNC_END when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_VSYNC_END { PARAM_VALUE.C_LCD_VSYNC_END } {
	# Procedure called to validate C_LCD_VSYNC_END
	return true
}

proc update_PARAM_VALUE.C_LCD_VSYNC_START { PARAM_VALUE.C_LCD_VSYNC_START } {
	# Procedure called to update C_LCD_VSYNC_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_LCD_VSYNC_START { PARAM_VALUE.C_LCD_VSYNC_START } {
	# Procedure called to validate C_LCD_VSYNC_START
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_ADDR_WIDTH { PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_M00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_ADDR_WIDTH { PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_M00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH } {
	# Procedure called to update C_M00_AXI_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH } {
	# Procedure called to validate C_M00_AXI_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH } {
	# Procedure called to update C_M00_AXI_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH } {
	# Procedure called to validate C_M00_AXI_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_BURST_LEN { PARAM_VALUE.C_M00_AXI_BURST_LEN } {
	# Procedure called to update C_M00_AXI_BURST_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_BURST_LEN { PARAM_VALUE.C_M00_AXI_BURST_LEN } {
	# Procedure called to validate C_M00_AXI_BURST_LEN
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_BUSER_WIDTH { PARAM_VALUE.C_M00_AXI_BUSER_WIDTH } {
	# Procedure called to update C_M00_AXI_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_BUSER_WIDTH { PARAM_VALUE.C_M00_AXI_BUSER_WIDTH } {
	# Procedure called to validate C_M00_AXI_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_DATA_WIDTH { PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to update C_M00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_DATA_WIDTH { PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_M00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_ID_WIDTH { PARAM_VALUE.C_M00_AXI_ID_WIDTH } {
	# Procedure called to update C_M00_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_ID_WIDTH { PARAM_VALUE.C_M00_AXI_ID_WIDTH } {
	# Procedure called to validate C_M00_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_RUSER_WIDTH { PARAM_VALUE.C_M00_AXI_RUSER_WIDTH } {
	# Procedure called to update C_M00_AXI_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_RUSER_WIDTH { PARAM_VALUE.C_M00_AXI_RUSER_WIDTH } {
	# Procedure called to validate C_M00_AXI_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to update C_M00_AXI_TARGET_SLAVE_BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to validate C_M00_AXI_TARGET_SLAVE_BASE_ADDR
	return true
}

proc update_PARAM_VALUE.C_M00_AXI_WUSER_WIDTH { PARAM_VALUE.C_M00_AXI_WUSER_WIDTH } {
	# Procedure called to update C_M00_AXI_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXI_WUSER_WIDTH { PARAM_VALUE.C_M00_AXI_WUSER_WIDTH } {
	# Procedure called to validate C_M00_AXI_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_FRAME_WIDTH { MODELPARAM_VALUE.C_FRAME_WIDTH PARAM_VALUE.C_FRAME_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FRAME_WIDTH}] ${MODELPARAM_VALUE.C_FRAME_WIDTH}
}

proc update_MODELPARAM_VALUE.C_FRAME_HEIGHT { MODELPARAM_VALUE.C_FRAME_HEIGHT PARAM_VALUE.C_FRAME_HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FRAME_HEIGHT}] ${MODELPARAM_VALUE.C_FRAME_HEIGHT}
}

proc update_MODELPARAM_VALUE.C_LCD_LINE_REG_WIDTH { MODELPARAM_VALUE.C_LCD_LINE_REG_WIDTH PARAM_VALUE.C_LCD_LINE_REG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_LINE_REG_WIDTH}] ${MODELPARAM_VALUE.C_LCD_LINE_REG_WIDTH}
}

proc update_MODELPARAM_VALUE.C_LCD_PIXEL_REG_WIDTH { MODELPARAM_VALUE.C_LCD_PIXEL_REG_WIDTH PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_PIXEL_REG_WIDTH}] ${MODELPARAM_VALUE.C_LCD_PIXEL_REG_WIDTH}
}

proc update_MODELPARAM_VALUE.C_LCD_LINES { MODELPARAM_VALUE.C_LCD_LINES PARAM_VALUE.C_LCD_LINES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_LINES}] ${MODELPARAM_VALUE.C_LCD_LINES}
}

proc update_MODELPARAM_VALUE.C_LCD_VSYNC_START { MODELPARAM_VALUE.C_LCD_VSYNC_START PARAM_VALUE.C_LCD_VSYNC_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_VSYNC_START}] ${MODELPARAM_VALUE.C_LCD_VSYNC_START}
}

proc update_MODELPARAM_VALUE.C_LCD_VSYNC_END { MODELPARAM_VALUE.C_LCD_VSYNC_END PARAM_VALUE.C_LCD_VSYNC_END } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_VSYNC_END}] ${MODELPARAM_VALUE.C_LCD_VSYNC_END}
}

proc update_MODELPARAM_VALUE.C_LCD_VACTIVE_START { MODELPARAM_VALUE.C_LCD_VACTIVE_START PARAM_VALUE.C_LCD_VACTIVE_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_VACTIVE_START}] ${MODELPARAM_VALUE.C_LCD_VACTIVE_START}
}

proc update_MODELPARAM_VALUE.C_LCD_HPIXELS { MODELPARAM_VALUE.C_LCD_HPIXELS PARAM_VALUE.C_LCD_HPIXELS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_HPIXELS}] ${MODELPARAM_VALUE.C_LCD_HPIXELS}
}

proc update_MODELPARAM_VALUE.C_LCD_HSYNC_START { MODELPARAM_VALUE.C_LCD_HSYNC_START PARAM_VALUE.C_LCD_HSYNC_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_HSYNC_START}] ${MODELPARAM_VALUE.C_LCD_HSYNC_START}
}

proc update_MODELPARAM_VALUE.C_LCD_HSYNC_END { MODELPARAM_VALUE.C_LCD_HSYNC_END PARAM_VALUE.C_LCD_HSYNC_END } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_HSYNC_END}] ${MODELPARAM_VALUE.C_LCD_HSYNC_END}
}

proc update_MODELPARAM_VALUE.C_LCD_HACTIVE_START { MODELPARAM_VALUE.C_LCD_HACTIVE_START PARAM_VALUE.C_LCD_HACTIVE_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_LCD_HACTIVE_START}] ${MODELPARAM_VALUE.C_LCD_HACTIVE_START}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR { MODELPARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR}] ${MODELPARAM_VALUE.C_M00_AXI_TARGET_SLAVE_BASE_ADDR}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_BURST_LEN { MODELPARAM_VALUE.C_M00_AXI_BURST_LEN PARAM_VALUE.C_M00_AXI_BURST_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_BURST_LEN}] ${MODELPARAM_VALUE.C_M00_AXI_BURST_LEN}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_ID_WIDTH { MODELPARAM_VALUE.C_M00_AXI_ID_WIDTH PARAM_VALUE.C_M00_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH PARAM_VALUE.C_M00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH PARAM_VALUE.C_M00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_AWUSER_WIDTH { MODELPARAM_VALUE.C_M00_AXI_AWUSER_WIDTH PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_ARUSER_WIDTH { MODELPARAM_VALUE.C_M00_AXI_ARUSER_WIDTH PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_WUSER_WIDTH { MODELPARAM_VALUE.C_M00_AXI_WUSER_WIDTH PARAM_VALUE.C_M00_AXI_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_RUSER_WIDTH { MODELPARAM_VALUE.C_M00_AXI_RUSER_WIDTH PARAM_VALUE.C_M00_AXI_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXI_BUSER_WIDTH { MODELPARAM_VALUE.C_M00_AXI_BUSER_WIDTH PARAM_VALUE.C_M00_AXI_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXI_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXI_BUSER_WIDTH}
}

