// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XKERNEL2SUM_H
#define XKERNEL2SUM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xkernel2sum_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XKernel2sum_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKernel2sum;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKernel2sum_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKernel2sum_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKernel2sum_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKernel2sum_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XKernel2sum_Initialize(XKernel2sum *InstancePtr, UINTPTR BaseAddress);
XKernel2sum_Config* XKernel2sum_LookupConfig(UINTPTR BaseAddress);
#else
int XKernel2sum_Initialize(XKernel2sum *InstancePtr, u16 DeviceId);
XKernel2sum_Config* XKernel2sum_LookupConfig(u16 DeviceId);
#endif
int XKernel2sum_CfgInitialize(XKernel2sum *InstancePtr, XKernel2sum_Config *ConfigPtr);
#else
int XKernel2sum_Initialize(XKernel2sum *InstancePtr, const char* InstanceName);
int XKernel2sum_Release(XKernel2sum *InstancePtr);
#endif

void XKernel2sum_Start(XKernel2sum *InstancePtr);
u32 XKernel2sum_IsDone(XKernel2sum *InstancePtr);
u32 XKernel2sum_IsIdle(XKernel2sum *InstancePtr);
u32 XKernel2sum_IsReady(XKernel2sum *InstancePtr);
void XKernel2sum_Continue(XKernel2sum *InstancePtr);
void XKernel2sum_EnableAutoRestart(XKernel2sum *InstancePtr);
void XKernel2sum_DisableAutoRestart(XKernel2sum *InstancePtr);


void XKernel2sum_InterruptGlobalEnable(XKernel2sum *InstancePtr);
void XKernel2sum_InterruptGlobalDisable(XKernel2sum *InstancePtr);
void XKernel2sum_InterruptEnable(XKernel2sum *InstancePtr, u32 Mask);
void XKernel2sum_InterruptDisable(XKernel2sum *InstancePtr, u32 Mask);
void XKernel2sum_InterruptClear(XKernel2sum *InstancePtr, u32 Mask);
u32 XKernel2sum_InterruptGetEnabled(XKernel2sum *InstancePtr);
u32 XKernel2sum_InterruptGetStatus(XKernel2sum *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
