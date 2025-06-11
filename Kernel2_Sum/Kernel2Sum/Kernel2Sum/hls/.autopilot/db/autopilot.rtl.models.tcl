set SynModuleInfo {
  {SRCNAME Kernel2Sum MODELNAME Kernel2Sum RTLNAME Kernel2Sum IS_TOP 1
    SUBMODULES {
      {MODELNAME Kernel2Sum_control_s_axi RTLNAME Kernel2Sum_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME Kernel2Sum_regslice_both RTLNAME Kernel2Sum_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
      {MODELNAME Kernel2Sum_flow_control_loop_pipe RTLNAME Kernel2Sum_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME Kernel2Sum_flow_control_loop_pipe_U}
    }
  }
}
