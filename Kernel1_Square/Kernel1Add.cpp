#include "hls_stream.h"



#define MaxN = 3

void SquareStream(hls::stream<int>& InputStream, hls::stream<int>& OutStream){
    int inVal, inputSq;
    do {
    inVal = InputStream.read();
    inputSq = inVal * inVal;
    OutStream.write(inputSq);
    }while (!InputStream.empty())
}

void example(hls::stream<int>& InputK1) {
#pragma HLS INTERFACE m_axi port = InputK1 depth=MaxN;
hls::stream<int> Out;

SquareStream(InputK1, Out);
}

