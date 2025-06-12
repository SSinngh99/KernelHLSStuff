set SynModuleInfo {
  {SRCNAME Kernel_Connector_Pipeline_VITIS_LOOP_6_1 MODELNAME Kernel_Connector_Pipeline_VITIS_LOOP_6_1 RTLNAME Kernel_Connector_Kernel_Connector_Pipeline_VITIS_LOOP_6_1
    SUBMODULES {
      {MODELNAME Kernel_Connector_mul_32s_32s_32_1_1 RTLNAME Kernel_Connector_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME Kernel_Connector_flow_control_loop_pipe_sequential_init RTLNAME Kernel_Connector_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME Kernel_Connector_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Kernel_Connector_Pipeline_VITIS_LOOP_8_1 MODELNAME Kernel_Connector_Pipeline_VITIS_LOOP_8_1 RTLNAME Kernel_Connector_Kernel_Connector_Pipeline_VITIS_LOOP_8_1}
  {SRCNAME Kernel_Connector MODELNAME Kernel_Connector RTLNAME Kernel_Connector IS_TOP 1
    SUBMODULES {
      {MODELNAME Kernel_Connector_fifo_w32_d3_S RTLNAME Kernel_Connector_fifo_w32_d3_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME intermediateStream_U}
      {MODELNAME Kernel_Connector_regslice_both RTLNAME Kernel_Connector_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
