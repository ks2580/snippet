#include <stdio.h>

void print_test(void)
{
    printf("is print_test\n");

    return ;
}

int file_dump_from_stdout(const char *path, void (*func)(void))
{
    FILE *fd;

    fd = freopen(path, "w", stdout);
    if (fd == NULL)
    {
        perror("freopen(1)");
        return -1;
    }

    (*func)();

    fd = freopen("/dev/tty", "w", stdout);
    if (fd == NULL)
    {
        perror("freopen(2)");
        return -1;
    }
    fclose(fd);

    return 0;
}

int main(int argc, char *argv[])
{

    file_dump_from_stdout("./log.log", print_test);

    return 0;
}
