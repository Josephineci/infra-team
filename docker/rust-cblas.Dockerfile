FROM rust:slim

ARG BUILD_CBLAS=False
ENV BUILD_CBLAS=$BUILD_CBLAS
ENV OPENBLAS_CORETYPE=Haswell
ENV OPENBLAS_TARGET=haswell
ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

RUN mkdir -p /root/.ssh; chmod 700 /root/.ssh
ADD ./known_hosts /root/.ssh/
ADD ./run_cargo_build.sh /usr/bin/
RUN chmod +x /usr/bin/run_cargo_build.sh && chmod 600 /root/.ssh/known_hosts
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y openssh-client cmake build-essential protobuf-compiler openssl \
    libprotobuf-dev libssl-dev libpq-dev pkg-config librdkafka-dev ninja-build ca-certificates

# Conditional installation based on BUILD_CBLAS
RUN if [ "${BUILD_CBLAS}" = "True" ]; then \
    apt-get install --no-install-recommends -y \
    gfortran openblas libopenblas-dev gcc clang; \
    echo "CBLAS installation"; \
    else \
    rm -rf /var/lib/apt/lists/*; \
    echo "Skipping CBLAS installation"; \
    fi

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/sigma
