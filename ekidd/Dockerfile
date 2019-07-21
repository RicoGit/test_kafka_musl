FROM ekidd/rust-musl-builder:nightly-2019-07-08-openssl11 AS builder

RUN sudo apt-get update && sudo apt-get install -y libclang-3.9 clang-3.9 llvm-3.9 \
    curl musl-dev musl-tools make python g++ && sudo chown -R rust:rust /home/rust