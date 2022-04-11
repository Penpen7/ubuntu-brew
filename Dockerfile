FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y -q --allow-unauthenticated \
    git \
    sudo \
    curl \
    file \
    procps \
    build-essential \
    language-pack-ja \
    expect \
    zsh
RUN useradd -m -s /bin/bash linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
ENV PATH /home/linuxbrew/.linuxbrew/bin:$PATH

CMD ["/usr/bin/zsh"]
