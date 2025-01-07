#include "Vmain.h"
#include <stdint.h>

extern "C" {
    void* new_main() {
        return new Vmain{};
    }

    void eval(void* main) {
        ((Vmain*)main)->eval();
    }

    void set_single(void* main, int32_t value) {
        ((Vmain*)main)->single_input = value;
    }

    int32_t get_single(void* main) {
        return ((Vmain*)main)->single_output;
    }
}
