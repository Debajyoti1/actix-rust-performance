# ---- Stage 1: Build ----
FROM rust:1.93-slim-bullseye AS builder

WORKDIR /app

# Copy Cargo files first for caching
COPY Cargo.toml Cargo.lock ./
COPY src ./src

# Build release version
RUN cargo build --release

# ---- Stage 2: Runtime ----
FROM debian:bullseye-slim

WORKDIR /app

# Copy compiled binary from builder
COPY --from=builder /app/target/release/actix-rust-performance .

EXPOSE 4242

# Run the app
CMD ["./actix-rust-performance"]