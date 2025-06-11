// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xkernel2sum.h"

extern XKernel2sum_Config XKernel2sum_ConfigTable[];

#ifdef SDT
XKernel2sum_Config *XKernel2sum_LookupConfig(UINTPTR BaseAddress) {
	XKernel2sum_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XKernel2sum_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XKernel2sum_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XKernel2sum_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKernel2sum_Initialize(XKernel2sum *InstancePtr, UINTPTR BaseAddress) {
	XKernel2sum_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKernel2sum_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKernel2sum_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XKernel2sum_Config *XKernel2sum_LookupConfig(u16 DeviceId) {
	XKernel2sum_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKERNEL2SUM_NUM_INSTANCES; Index++) {
		if (XKernel2sum_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKernel2sum_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKernel2sum_Initialize(XKernel2sum *InstancePtr, u16 DeviceId) {
	XKernel2sum_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKernel2sum_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKernel2sum_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

