FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
      build-essential \
      cmake \
      git \
      clang-format \
      python3 \
      python3-pip \
      ca-certificates \
      && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages pre-commit

WORKDIR /workspace

CMD ["/bin/bash"]
