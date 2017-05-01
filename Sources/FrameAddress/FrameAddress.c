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
    char ** ptrs;
    intptr_t strs;
    
    Dl_info *info = calloc(size, sizeof(Dl_info));
    if (info == NULL) return NULL;
    
    size_t totalBytes = sizeof(char *) * size;
    
    for (i = 0; i <= size; ++i) {
        dladdr(buffer[i], &info[i]);
        if (info[i].dli_sname) totalBytes += (strlen(info[i].dli_sname) + 1);
    }
    
    result = malloc(totalBytes);
    if (result == NULL) {
        free(info);
        return NULL;
    }
    
    ptrs = result;
    strs = ((intptr_t)result) + sizeof(char *) * size;
    
    for (i = 0; i < size; ++i) {
        ptrs[i] = (char *)strs;
        strs += snprintf((char *) strs, totalBytes, "%s", info[i].dli_sname) + 1;
    }
    
    free(info);
    return result;
}

char **get_stack_trace(int buffer_size, int *result_count) {
    void *buffer[buffer_size];
    char **strings;

    *result_count = backtrace(buffer, buffer_size);
    return get_symbols_for_backtrace(buffer, buffer_size);
}


