# Application description

This application use rdkafka and zstd compressing library.

# Build rust with ekidd/rust-musl-builder docker image

// todo


# Build rust with clux/muslrust docker image

// todo 

# Build rust with official docker image  rust/rust

building: `make docker3` - builds docker image with our application

running: `docker run rustapp:latest`  - run docker image 
    