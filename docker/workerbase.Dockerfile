FROM rust:slim
EXPOSE 49051/tcp

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y ca-certificates openssh-client openssl libssl-dev libpq-dev wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/v0.4.18/grpc_health_probe-linux-amd64 && \
    chmod +x grpc_health_probe-linux-amd64
