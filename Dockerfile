FROM rust:1.55-slim

# Non-Rust tooling
ENV TZ=US/New_York
RUN apt-get update -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    rr \
    tree \
    vim

# Rust tooling
RUN rustup default nightly
RUN cargo install cargo-fuzz

# Src import
RUN mkdir /diff-fuzz-blog-post
WORKDIR /diff-fuzz-blog-post
COPY . /sdiff-fuzz-blog-post/
