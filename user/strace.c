#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char **argv)
{
    int pid = fork();
    if (!pid)
    {
        trace(atoi(argv[1]));

        if (exec(argv[2], argv + 2) < 0)
            printf("Exec error\n");
    }
    else
    {
        int status;
        wait(&status);
    }
    // return 0;
    exit(0);
}