#ifndef KRNL_CONNECTOR_H
#define KRNL_CONNECTOR_H

#include <stdint.h>
#include <hls_stream.h>
#include "../../Kernel2_Sum/Kernel2Sum/Kernel2Sum.h"
#include "../../Kernel1_Square/Kernel1Square.h"



#define MaxN 3

extern "C" {
void Kernel_Connector(hls::stream<int>& InputK1, hls::stream<int>& Out);
}

#endif // KRNL_CONNECTOR_H