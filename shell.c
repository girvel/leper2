#include <unistd.h>
#include <sys/wait.h>

int main(void) {
    for (;;) {
        write(1, "# ", 2);
        char command[255];
        int count = read(0, command, 255);
        command[count - 1] = 0;
        pid_t fork_result = fork();
        if (fork_result == 0) {
            execve(command, NULL, NULL);
            break;
        } else {
            siginfo_t info;
            waitid(P_ALL, 0, &info, WEXITED);
        }
    }
}
