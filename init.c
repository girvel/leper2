#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(void) {
    mkdir("/lib64", 0755);
    rename("/ld-linux-x86-64.so.2", "/lib64/ld-linux-x86-64.so.2");

    mkdir("/lib", 0755);
    mkdir("/lib/x86_64-linux-gnu/", 0755);

    rename("/libc.so.6", "/lib/x86_64-linux-gnu/libc.so.6");
    rename("/libm.so.6", "/lib/x86_64-linux-gnu/libm.so.6");
    rename("/libgcc_s.so.1", "/lib/x86_64-linux-gnu/libgcc_s.so.1");
    rename("/libc.so.6", "/lib/x86_64-linux-gnu/libc.so.6");

    char *const argv[] = {"lua", "/core/init.lua", NULL};
    char *const envp[] = {NULL};
    execve("lua", argv, envp);
}
