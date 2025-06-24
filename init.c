#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

int main(void) {
    char *const argv[] = {"lua", "/core/init.lua", NULL};
    char *const envp[] = {NULL};
    execve("lua", argv, envp);
}
