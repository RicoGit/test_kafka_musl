FROM ekidd/rust-musl-builder:nightly AS builder

RUN sudo apt-get update && sudo apt-get install -y libclang-3.9 clang-3.9 llvm-3.9 \
    curl musl-dev musl-tools make python && sudo chown -R rust:rust /home/rust