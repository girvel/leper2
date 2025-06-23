#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    char *const argv[] = {"lua", "init.lua", NULL};
    char *const envp[] = {NULL};
    execve("lua", argv, envp);
}
