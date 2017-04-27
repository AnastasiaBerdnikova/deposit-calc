.PHONY:	test clean
	
all : calc depcalc-test

calc:	build/src/main.o build/src/deposit.o
	gcc build/src/main.o build/src/deposit.o -o bin/depcalc

build/src/deposit.o:	src/deposit.c
	gcc -Wall -Werror -c src/deposit.c -o build/src/deposit.o

build/src/main.o:	src/main.c
	gcc -Wall -Werror -c src/main.c -o build/src/main.o

test: depcalc-test

depcalc-test: build/test/main.o build/test/depcalc_test.o build/src/deposit.o
	gcc build/test/main.o build/test/depcalc_test.o build/src/deposit.o -o bin/depcalc-test

build/test/main.o: test/main.c
	gcc -I src -I thirdparty -Wall -Werror -c test/main.c -o build/test/main.o

build/test/depcalc_test.o: test/depcalc_test.c
	gcc -I thirdparty -I src -Wall -Werror -c test/depcalc_test.c -o build/test/depcalc_test.o

clean:
	rm -rf build/test/*.o build/src/*.o bin/*
