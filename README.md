# Application description

This application use rdkafka and zstd compressing library.

# Build rust with ekidd/rust-musl-builder docker image

// works without zstd


# Build rust with clux/muslrust docker image

building: `make docker2` - builds docker image with our application

running: `docker run musl:latest`  - run docker image 

# Build rust with official docker image  rust/rust

building: `make docker3` - builds docker image with our application

running: `docker run rustapp:latest`  - run docker image 
    