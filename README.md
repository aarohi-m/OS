# 64-bit Operating System Kernel 
# Project Status: Bootloader & Kernel Entry Complete
This is the repository for my operating system kernel, designed for the x86-64 architecture. The entire build process is self-contained and reproducible via Docker.

# Current Major Achievement:

The entire boot sequence (Multiboot2 header setup, 32-bit entry, Protected Mode configuration, and switch to 64-bit Long Mode) is complete and functional.

The kernel successfully reaches its final Assembly entry point and is ready to jump to the main C function.

Next Immediate Focus: Implementing the C Runtime environment and starting the main kernel logic in kmain.

# Technical Architecture
The kernel is designed to be lean and modular, using a hybrid language approach:

Component

Language

Role

Status

Toolchain

Dockerfile

Defines the reproducible cross-compilation environment (x86_64-elf, NASM).

Complete

Boot Sequence

Assembly (.asm)

Handles the immediate hardware setup and transition from bootloader to Long Mode.

Completed

Core Logic

C (.c)

Will handle all high-level kernel tasks, including memory, tasks, and drivers.

Next Step

Linking

Linker Script (linker.ld)

Defines the memory layout and linking structure for both Assembly and C code.

# Required

Build & Run Instructions
A consistent build environment is crucial for OS development.  used Docker to provide a 100% reproducible toolchain.

Prerequisites
Docker: To contain the cross-compiler and build utilities.

QEMU: To test the resulting ISO image.

# Build the Toolchain Image
This command reads the Dockerfile and creates a self-contained image named my-os-builder.

docker build -t my-os-builder .

# Compile and Link the Kernel
The build.sh script automates all steps: assembly, C compilation, linking with the linker.ld script, and generating the bootable ISO.

docker run --rm -v "$(pwd):/root/env" my-os-builder /root/env/build.sh

# Test the Kernel in QEMU
After a successful build, a kernel.iso file is generated. Use QEMU to instantly verify the kernel's boot status:

qemu-system-x86_64 -cdrom kernel.iso
