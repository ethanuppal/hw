#include "Vmain.h"
#include "verilated.h"
int main(int argc, char** argv) {
    VerilatedContext* context = new VerilatedContext;
    context->commandArgs(argc, argv);
    Vmain* top = new Vmain{context};
    while (!context->gotFinish()) {
        top->eval();
    }
    delete top;
    delete context;
    return 0;
}
