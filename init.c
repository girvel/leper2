#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(void) {
    mkdir("/lib64", 0755);
    rename("/lib/ld-linux-x86-64.so.2", "/lib64/ld-linux-x86-64.so.2");

    char *const argv[] = {"lua", "/core/init.lua", NULL};
    char *const envp[] = {NULL};
    execve("lua", argv, envp);
}
