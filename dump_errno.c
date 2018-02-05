#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
    int idx;

    for (idx = 0; idx < _sys_nerr; idx++)
    {
        printf("#%3d(0x%04x): %s\n", idx, idx, strerror(idx));
    }

    return 0;
}
