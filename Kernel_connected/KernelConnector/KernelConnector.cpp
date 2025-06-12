#include "hls_stream.h"
#include "KernelConnector.h"
// #pragma HLS DATAFLOW

void Kernel_Connector(hls::stream<int>& InputStream, hls::stream<int>& OutStream) {
    #pragma HLS INTERFACE axis port = InputStream depth=MaxN
   
    hls::stream<int> intermediateStream;
    #pragma HLS STREAM variable=intermediateStream depth=MaxN 
    #pragma HLS INTERFACE axis port = intermediateStream depth=MaxN

    Kernel1_Square(InputStream, intermediateStream);
    Kernel2Sum(intermediateStream, OutStream);
}
