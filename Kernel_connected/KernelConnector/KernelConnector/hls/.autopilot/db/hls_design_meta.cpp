#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("InputStream_TDATA", 32, hls_in, 0, "axis", "in_data", 1),
	Port_Property("InputStream_TVALID", 1, hls_in, 0, "axis", "in_vld", 1),
	Port_Property("InputStream_TREADY", 1, hls_out, 0, "axis", "in_acc", 1),
	Port_Property("OutStream_din", 32, hls_out, 1, "ap_fifo", "fifo_data_in", 1),
	Port_Property("OutStream_full_n", 1, hls_in, 1, "ap_fifo", "fifo_status", 1),
	Port_Property("OutStream_write", 1, hls_out, 1, "ap_fifo", "fifo_port_we", 1),
};
const char* HLS_Design_Meta::dut_name = "Kernel_Connector";
