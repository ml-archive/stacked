#include <execinfo.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#ifndef _GNU_SOURCE
    #define _GNU_SOURCE
#endif
#include <dlfcn.h>

char ** get_symbols_for_backtrace(void * const *buffer, int size) {
    int i;
    char ** result;
    
    result = malloc(sizeof(char *) * size);
    if (result == NULL) return NULL;
    
    for (i = 0; i <= size; ++i) {
        Dl_info info;
        dladdr(buffer[i], &info);
        
        char *name = "???";
        if (info.dli_sname) {
            name = (char *)info.dli_sname;
        }
        
        result[i] = strdup(name);
    }
    
    return result;
}

char **get_stack_trace(int buffer_size, int *result_count) {
    void *buffer[buffer_size];
    *result_count = backtrace(buffer, buffer_size);
    
    return get_symbols_for_backtrace(buffer, *result_count);
}
