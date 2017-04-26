.PHONY:	all clean
	
all : calc

calc:	build/main.o build/deposit.o
	gcc build/main.o build/deposit.o -o bin/deposit-calc

build/deposit.o:	src/deposit.c
	gcc -Wall -Werror -c src/deposit.c -o build/deposit.o

build/main.o:	src/main.c
	gcc -Wall -Werror -c src/main.c -o build/main.o

clean:
	rm -rf build/*.o bin/deposit-calc
