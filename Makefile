TARGET := riscv64gc-unknown-none-elf
MODE := release
KERNEL_DIR := os
USER_DIR := user

setup:
	@rustup toolchain install nightly-2025-03-01 
	@rustup override set nightly-2025-03-01
	@rustup target add $(TARGET)
	@rustup component add llvm-tools-preview


build: 
	@cd $(KERNEL_DIR) && make build

build-and-run: build
	@cd $(KERNEL_DIR) && make run-only
