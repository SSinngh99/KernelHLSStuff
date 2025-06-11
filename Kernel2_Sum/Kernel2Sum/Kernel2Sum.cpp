#include "Kernel2Sum.h"

void Kernel2Sum(hls::stream<int>& InputStream, hls::stream<int>& OutStream) {
    #pragma HLS INTERFACE axis port = InputStream depth=MaxN
    int inVal1 = 0; 
    int inVal2 = 0;
    int outVal;
    do {
        inVal2 = InputStream.read();
        outVal = inVal1 + inVal2;
        inVal1 = outVal;
        OutStream.write(outVal);
    }
    while (!InputStream.empty());
}
