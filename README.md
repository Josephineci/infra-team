# custom_rust_images
# Sigma Base Rust Images

[![Publish to Amazon ECR](https://github.com/team-sigma-ai/sigma-base-images/actions/workflows/rust-ecr.yml/badge.svg)](https://github.com/team-sigma-ai/sigma-base-images/actions/workflows/rust-ecr.yml)

## Overview

The objective of this repository is to publish foundational images for Rust deployments. We construct and release the following three images to AWS ECR:

- `rust_base_image_{ENVIRONMENT}`:
    This image is intended for widespread use, encompassing all the necessary dependencies such as `libpq-dev`, `libprotobuf-dev`, `protobuf-compiler`, and `librdkafka-dev`.

- `rust_math_base_image_{ENVIRONMENT}`:
    An extension of the `RUST_BASE_IMAGE` images, this variant includes additional installations of `libopenblas-base`, `gfortran`, and `libopenblas-dev`.

- `rust_deployment_bullseye_image_{ENVIRONMENT}`:
    This base image comprises of the required installations for deployment in an EKS Cluster at Sigma.

## Bumping Rust Version

To upgrade to the latest version you'll need to update in two locations:

1. [Github Runner](.github/workflows/rust-ecr.yml): Updating the environment variable `ENV: RUST_VERSION: 1.75.0`.
2. [rust-cblas file](docker/rust-cblas.Dockerfile): Updating the ARG value at the top of the file `ARG RUST_VERSION=1.75.0`
