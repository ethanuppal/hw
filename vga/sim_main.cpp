#include "Vtb.h"
#include <verilated.h>

int main(int argc, char** argv) {
    VerilatedContext* context = new VerilatedContext;
    context->commandArgs(argc, argv);
    Vtb* test_bench = new Vtb{context};
    while (!context->gotFinish()) {
        test_bench->eval();
    }
    delete test_bench;
    delete context;
    return 0;
}
