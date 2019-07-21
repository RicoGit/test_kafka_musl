
build1: builder-image

	docker run --rm -it \
		-e RUST_BACKTRACE=1 \
		-v $$(pwd)/:/home/rust/src \
		-v $$(pwd)/target_distrib/.cargo-git:/home/rust/.cargo/git \
		-v $$(pwd)/target_distrib/.cargo-registry:/home/rust/.cargo/registry \
		-v $$(pwd)/target_distrib/.rustup:/home/rust/.rustup \
		-v $$(pwd)/target_distrib/target:/home/rust/src/target \
		-t builder1 /bin/bash -c "rustup target add x86_64-unknown-linux-musl && cargo -V && LIB_LDFLAGS=-L/usr/lib/x86_64-linux-gnu CFLAGS=-I/usr/local/musl/include CC=musl-gcc cargo build --release"

builder-image:
	docker build -t builder1 .