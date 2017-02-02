#undef NDEBUG
#ifndef _minunit_h
#define _minunit_h

#include <stdio.h>
#include <dbg.h>
#include <stdlib.h>
#include <string.h>

#define mu_suite_start() char *message = NULL

#define mu_assert(test, message, ...) if (!(test)) { log_err(message, ##__VA_ARGS__); return message; }

#define mu_run_test(test) debug("\n-----%s", " " #test); \
    message = test(); tests_run++; if(message) return message;

#define RUN_TESTS(name) int main(int argc, char* argv[]) {\
    argc++; \
    debug("----- RUNNING: %s\n", argv[0]);\
    char* result = name();\
    if (result != NULL) {\
        printf("\x1b[31mTEST FAILED\x1b[0m\n");\
    }\
    else {\
        printf("\x1b[32mALL TESTS PASSED\x1b[0m\n");\
    }\
    printf("Tests run: %d\n", tests_run);\
    exit(result != NULL);\
}

static int tests_run;

#endif
