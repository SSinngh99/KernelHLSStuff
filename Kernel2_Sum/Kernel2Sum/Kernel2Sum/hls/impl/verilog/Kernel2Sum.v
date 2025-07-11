// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Kernel2Sum_Kernel2Sum,hls_ip_2024_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.795000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=74,HLS_SYN_LUT=146,HLS_VERSION=2024_1}" *)

module Kernel2Sum (
        ap_clk,
        ap_rst_n,
        OutStream_TREADY,
        InputStream_TDATA,
        InputStream_TVALID,
        InputStream_TREADY,
        OutStream_TDATA,
        OutStream_TVALID,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 4;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   OutStream_TREADY;
input  [31:0] InputStream_TDATA;
input   InputStream_TVALID;
output   InputStream_TREADY;
output  [31:0] OutStream_TDATA;
output   OutStream_TVALID;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

(* shreg_extract = "no" *) reg    ap_rst_reg_2;
(* shreg_extract = "no" *) reg    ap_rst_reg_1;
(* shreg_extract = "no" *) reg    ap_rst_n_inv;
wire    ap_start;
wire    ap_done;
wire    ap_continue;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire    ap_ready;
wire    ap_CS_fsm_state2;
wire    regslice_both_OutStream_U_apdone_blk;
reg    ap_block_state2_pp0_stage1_iter0;
wire   [0:0] tmp_nbreadreq_fu_59_p3;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    InputStream_TDATA_blk_n;
reg    ap_done_reg;
reg    OutStream_TDATA_blk_n;
wire   [31:0] outVal_fu_75_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [31:0] inVal1_fu_42;
wire    ap_loop_init;
reg   [31:0] ap_sig_allocacmp_inVal1_1;
wire    ap_continue_int;
reg    ap_done_int;
reg   [1:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    regslice_both_InputStream_U_apdone_blk;
wire   [31:0] InputStream_TDATA_int_regslice;
wire    InputStream_TVALID_int_regslice;
reg    InputStream_TREADY_int_regslice;
wire    regslice_both_InputStream_U_ack_in;
wire   [31:0] OutStream_TDATA_int_regslice;
reg    OutStream_TVALID_int_regslice;
wire    OutStream_TREADY_int_regslice;
wire    regslice_both_OutStream_U_vld_out;
reg    ap_condition_175;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_rst_reg_2 = 1'b1;
#0 ap_rst_reg_1 = 1'b1;
#0 ap_rst_n_inv = 1'b1;
#0 ap_CS_fsm = 2'd1;
#0 ap_done_reg = 1'b0;
#0 inVal1_fu_42 = 32'd0;
end

Kernel2Sum_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_continue(ap_continue),
    .ap_idle(ap_idle)
);

Kernel2Sum_flow_control_loop_pipe flow_control_loop_pipe_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int),
    .ap_continue(ap_continue)
);

Kernel2Sum_regslice_both #(
    .DataWidth( 32 ))
regslice_both_InputStream_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(InputStream_TDATA),
    .vld_in(InputStream_TVALID),
    .ack_in(regslice_both_InputStream_U_ack_in),
    .data_out(InputStream_TDATA_int_regslice),
    .vld_out(InputStream_TVALID_int_regslice),
    .ack_out(InputStream_TREADY_int_regslice),
    .apdone_blk(regslice_both_InputStream_U_apdone_blk)
);

Kernel2Sum_regslice_both #(
    .DataWidth( 32 ))
regslice_both_OutStream_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(OutStream_TDATA_int_regslice),
    .vld_in(OutStream_TVALID_int_regslice),
    .ack_in(OutStream_TREADY_int_regslice),
    .data_out(OutStream_TDATA),
    .vld_out(regslice_both_OutStream_U_vld_out),
    .ack_out(OutStream_TREADY),
    .apdone_blk(regslice_both_OutStream_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0)) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    ap_rst_n_inv <= ap_rst_reg_1;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_1 <= ap_rst_reg_2;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_2 <= ~ap_rst_n;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_175)) begin
        inVal1_fu_42 <= outVal_fu_75_p2;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start_int == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        InputStream_TDATA_blk_n = InputStream_TVALID_int_regslice;
    end else begin
        InputStream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state1_pp0_stage0_iter0)) & (1'b1 == ap_CS_fsm_state1))) begin
        InputStream_TREADY_int_regslice = 1'b1;
    end else begin
        InputStream_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (~((ap_done_reg == 1'b1) | (ap_start_int == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        OutStream_TDATA_blk_n = OutStream_TREADY_int_regslice;
    end else begin
        OutStream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state1_pp0_stage0_iter0)) & (1'b1 == ap_CS_fsm_state1))) begin
        OutStream_TVALID_int_regslice = 1'b1;
    end else begin
        OutStream_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state1_pp0_stage0_iter0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0)) & (tmp_nbreadreq_fu_59_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0)) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0)) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_inVal1_1 = 32'd0;
    end else begin
        ap_sig_allocacmp_inVal1_1 = inVal1_fu_42;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state1_pp0_stage0_iter0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state2_pp0_stage1_iter0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign InputStream_TREADY = regslice_both_InputStream_U_ack_in;

assign OutStream_TDATA_int_regslice = (InputStream_TDATA_int_regslice + ap_sig_allocacmp_inVal1_1);

assign OutStream_TVALID = regslice_both_OutStream_U_vld_out;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (1'b0 == OutStream_TREADY_int_regslice) | (1'b0 == InputStream_TVALID_int_regslice) | (ap_start_int == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = ((regslice_both_OutStream_U_apdone_blk == 1'b1) | (1'b0 == OutStream_TREADY_int_regslice));
end

always @ (*) begin
    ap_condition_175 = (~((1'b0 == OutStream_TREADY_int_regslice) | (1'b1 == ap_block_state1_pp0_stage0_iter0)) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_done = ap_done_sig;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ap_ready = ap_ready_sig;

assign outVal_fu_75_p2 = (InputStream_TDATA_int_regslice + ap_sig_allocacmp_inVal1_1);

assign tmp_nbreadreq_fu_59_p3 = InputStream_TVALID_int_regslice;

endmodule //Kernel2Sum
