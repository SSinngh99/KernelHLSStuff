set SynModuleInfo {
  {SRCNAME Kernel1_Square MODELNAME Kernel1_Square RTLNAME Kernel1_Square IS_TOP 1
    SUBMODULES {
      {MODELNAME Kernel1_Square_mul_32s_32s_32_1_1 RTLNAME Kernel1_Square_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME Kernel1_Square_regslice_both RTLNAME Kernel1_Square_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
      {MODELNAME Kernel1_Square_flow_control_loop_pipe RTLNAME Kernel1_Square_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME Kernel1_Square_flow_control_loop_pipe_U}
    }
  }
}
