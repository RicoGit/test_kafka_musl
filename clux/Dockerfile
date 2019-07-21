FROM clux/muslrust:nightly AS builder

RUN apt-get update && apt-get install -y libclang-3.9 clang-3.9 llvm-3.9 \
    curl musl-dev musl-tools make python