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

    Dl_info *info = calloc(size, sizeof(Dl_info));
    if (info == NULL) return NULL;
    
    result = malloc(sizeof(char *) * size);
    if (result == NULL) {
        free(info);
        return NULL;
    }
    
    for (i = 0; i <= size; ++i) {
        dladdr(buffer[i], &info[i]);
        
        char *name = "???";
        if (info[i].dli_sname) {
            name = (char *)info[i].dli_sname;
        }
        
        result[i] = strdup(name);
    }
    
    free(info);
    return result;
}

char **get_stack_trace(int buffer_size, int *result_count) {
    void *buffer[buffer_size];
    *result_count = backtrace(buffer, buffer_size);
    
    return get_symbols_for_backtrace(buffer, *result_count);
}
