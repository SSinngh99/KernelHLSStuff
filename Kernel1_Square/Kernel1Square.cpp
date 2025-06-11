#include "hls_stream.h"



#define MaxN = 3
const int MaxDepth = 3;

void SquareStream(hls::stream<int>& InputStream, hls::stream<int>& OutStream){
    int inVal, inputSq;
    do {
    inVal = InputStream.read();
    inputSq = inVal * inVal;
    OutStream.write(inputSq);
    }while (!InputStream.empty());
}

void Kernel1_Square(hls::stream<int>& InputK1) {
#pragma HLS INTERFACE axis port = InputK1 depth=MaxDepth
hls::stream<int> Out;

SquareStream(InputK1, Out);
}

