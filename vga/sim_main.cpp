#include "Vtb.h"
#include <verilated.h>

int main(int argc, char** argv) {
    VerilatedContext* contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    Vtb* test_bench = new Vtb{contextp};
    while (!contextp->gotFinish()) {
        test_bench->eval();
    }
    delete test_bench;
    delete contextp;
    return 0;
}
