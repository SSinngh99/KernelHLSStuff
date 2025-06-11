#ifndef KRNL2_SUM_H
#define KRNL2_SUM_H

#include <stdint.h>
#include <hls_stream.h>

#define MaxN 3

extern "C" {
void Kernel2Sum(hls::stream<int>& InputStream2, hls::stream<int>& OutputStream2);
}

#endif // KRNL2_SUM_H