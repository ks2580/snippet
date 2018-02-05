GCC  = gcc
DEL  = rm
MAKE = make
SRC  = $(wildcard *.c)
PRG  = $(SRC:.c=.x)
LIB  = -lpthread -lrt -lm~
TAR  = sample-`date +%y%m%d`.tgz
DIR  = sample
CFL  = -D_POSIX_SOURCE -D_GNU_SOURCE

.SUFFIXES: .c .o .x

.c.x:
	$(GCC) -m32 $(CFL) $< -g -Wall -o $@ $(LIB)

all: $(PRG)

$(PRG): $(SRC)

clean:
	$(DEL) -f $(PRG)
	$(DEL) -f ./*.log
	$(DEL) -f ./core.*

install:
	$(MAKE) clean
	$(MAKE)

ar:
	mkdir ${DIR}
	cp ./*.c ./*.hh ./*sh* ${DIR}
	cp makefile ${DIR}
	tar czvf ${TAR} ${DIR}
	$(DEL) -rf ${DIR}

