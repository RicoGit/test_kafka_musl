
# Build with ekidd/rust-musl-builder
# built success for Rust 1.33.00, 1.36.00
# nightly and nightly-2019-07-08 was failed

build1: builder-image

	docker run --rm -it \
		-e RUST_BACKTRACE=1 \
		-v $$(pwd)/:/home/rust/src \
		-v $$(pwd)/target_distrib/.cargo-git:/home/rust/.cargo/git \
		-v $$(pwd)/target_distrib/.cargo-registry:/home/rust/.cargo/registry \
		-v $$(pwd)/target_distrib/.rustup:/home/rust/.rustup \
		-v $$(pwd)/target_distrib/target:/home/rust/src/target \
		-t builder1 /bin/bash -c "rustup target add x86_64-unknown-linux-musl && LIB_LDFLAGS=-L/usr/lib/x86_64-linux-gnu CFLAGS=-I/usr/local/musl/include CC=musl-gcc cargo build --release"


## Build with clux/muslrust
build2: builder-image2

	docker run --rm \
		-v $$PWD:/volume \
		-v $$PWD/target_distrib2/.cargo-git:/root/.cargo/git \
		-v $$PWD/target_distrib2/.cargo-registry:/root/.cargo/registry \
		-v $$(pwd)/target_distrib2/.rustup:/root/.rustup \
		-v $$(pwd)/target_distrib2/target:/volume/target \
		-w /volume \
		builder2 /bin/bash -c "CC=musl-gcc CXX=g++ && rustup target add x86_64-unknown-linux-musl && cargo build --release -vv"

# Build with official Rust image
build3: builder-image3

	docker run --rm \
		-v $$PWD:/volume \
		-v $$PWD/target_distrib3/.cargo-git:/usr/local/cargo/git \
		-v $$PWD/target_distrib3/.cargo-registry:/usr/local/cargo/registry \
		-v $$(pwd)/target_distrib3/.rustup:/usr/local/rustup \
		-v $$(pwd)/target_distrib3/target:/volume/target \
		-w /volume \
	builder3 /bin/bash -c "cargo build --release -vv"

docker2: build2
	docker build --no-cache -t musl -f clux/Dockerfile .

docker3: build3
	docker build --no-cache -t rustapp -f rust/Dockerfile .

builder-image:
	docker build -f ekidd/Dockerfile -t builder1 .

builder-image2:
	docker build -f clux/Builder_dockerfile -t builder2 .

builder-image3:
	docker build -f rust/Builder_dockerfile -t builder3 .