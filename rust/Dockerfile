# Build production container
FROM rust:slim

COPY ./target_distrib3/target/release/test_kafka_musl /app

ENTRYPOINT ["/app"]
