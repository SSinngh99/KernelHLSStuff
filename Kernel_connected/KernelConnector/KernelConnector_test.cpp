#include "KernelConnector.h"

int main(){

    hls::stream<int> InputStream_Test;
    hls::stream<int> OutputStream_Test;

    for (int i=0; i < MaxN; i++){
        InputStream_Test.write(i+1);
    }

    Kernel_Connector(InputStream_Test, OutputStream_Test);

    for (int i = 0; i < MaxN ; i++){
    std::cout << "input # = " << i+1 << ", Output stream = " << OutputStream_Test.read() << std::endl;
    }
}