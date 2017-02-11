#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

char **get_stack_trace(int buffer_size, int *result_count) {
    void *buffer[buffer_size];
    char **strings;

    *result_count = backtrace(buffer, buffer_size);
    return backtrace_symbols(buffer, *result_count);
}
