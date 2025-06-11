// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xkernel2sum.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKernel2sum_CfgInitialize(XKernel2sum *InstancePtr, XKernel2sum_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKernel2sum_Start(XKernel2sum *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKernel2sum_IsDone(XKernel2sum *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKernel2sum_IsIdle(XKernel2sum *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKernel2sum_IsReady(XKernel2sum *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKernel2sum_Continue(XKernel2sum *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XKernel2sum_EnableAutoRestart(XKernel2sum *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKernel2sum_DisableAutoRestart(XKernel2sum *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_AP_CTRL, 0);
}

void XKernel2sum_InterruptGlobalEnable(XKernel2sum *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_GIE, 1);
}

void XKernel2sum_InterruptGlobalDisable(XKernel2sum *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_GIE, 0);
}

void XKernel2sum_InterruptEnable(XKernel2sum *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_IER);
    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_IER, Register | Mask);
}

void XKernel2sum_InterruptDisable(XKernel2sum *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_IER);
    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKernel2sum_InterruptClear(XKernel2sum *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKernel2sum_WriteReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_ISR, Mask);
}

u32 XKernel2sum_InterruptGetEnabled(XKernel2sum *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_IER);
}

u32 XKernel2sum_InterruptGetStatus(XKernel2sum *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKernel2sum_ReadReg(InstancePtr->Control_BaseAddress, XKERNEL2SUM_CONTROL_ADDR_ISR);
}

