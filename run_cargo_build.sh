#!/bin/bash
echo "${GH_SSH}" | base64 --decode > ~/.ssh/id_github && chmod 0600 ~/.ssh/id_github
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_github
cargo build --release