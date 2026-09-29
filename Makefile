CFLAGS=-g

.PHONY: all
all: wforth wforth-maxtext wforth-rv64 wforth-aarch64 test

.PHONY: wforth
wforth:
	CC=$(CC) CFLAGS=$(CFLAGS) ./build.sh $@ x86_64 core

.PHONY: wforth-maxtext
wforth-maxtext:
	CC=$(CC) CFLAGS=$(CFLAGS) ./build.sh $@ x86_64/maxtext core

.PHONY: wforth-rv64
wforth-rv64:
	CC=riscv64-linux-gnu-gcc CFLAGS=$(CFLAGS) ./build.sh $@ riscv/rv64 core dbg

.PHONY: wforth-aarch64
wforth-aarch64:
	CC=aarch64-linux-gnu-gcc CFLAGS="$(CFLAGS) -mcmodel=tiny" ./build.sh $@ aarch64 core dbg

.PHONY: clean
clean:
	rm -f wforth wforth-maxtext wforth-rv64 wforth-aarch64 *.o *.S

test: test-wforth test-wforth-maxtext test-wforth-rv64 test-wforth-aarch64

.PHONY: test-wforth-maxtext
test-wforth-maxtext:
	cd test/src && cat tester.fr core.fr | ../../wforth-maxtext | diff - ../../test.exp64

.PHONY: test-wforth
test-wforth:
	cd test/src && cat tester.fr core.fr | ../../wforth | diff - ../../test.exp64

.PHONY: test-wforth-rv64
test-wforth-rv64:
	cd test/src && cat tester.fr core.fr | qemu-riscv64 -L /usr/riscv64-linux-gnu ../../wforth-rv64 | diff - ../../test.exp64

.PHONY: test-wforth-aarch64
test-wforth-aarch64:
	cd test/src && cat tester.fr core.fr | qemu-aarch64 -L /usr/aarch64-linux-gnu ../../wforth-aarch64 | diff - ../../test.exp64
