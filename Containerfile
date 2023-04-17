FROM quay.io/toolbx-images/alpine-toolbox:edge

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience for ublue-bayou and look alike" \
      maintainer="stephan.luescher@mykolab.com"

# install alpine packages
COPY  extra-packages /
RUN   apk update && \
      apk upgrade && \
      grep -v '^#' /extra-packages | xargs apk add
RUN   rm /extra-packages

# install pipx
ENV PIPX_HOME="/opt/pipx"
ENV PIPX_BIN_DIR="/opt/pipx/bin"
ENV PIPX_DEFAULT_PYTHON="/usr/bin/python"
ENV PATH "$PATH:$PIPX_BIN_DIR"
RUN   python3 -m pip install pipx && \
      python3 -m pipx ensurepath

# install poetry
ENV POETRY_CONFIG_DIR="/opt/pypoetry"
ENV POETRY_DATA_DIR="/opt/pypoetry"
ENV POETRY_CACHE_DIR="/opt/pypoetry"
RUN   pipx install poetry

# install oh-my-zsh
ENV ZSH="/opt/oh-my-zsh"
RUN   sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY  opt/oh-my-zsh /opt/oh-my-zsh

# add symlinks from host system
RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/bin/just && \
      ln -fs /usr/bin/distrobox-host-exec /usr/bin/btop

# clean up and finalize container build
RUN   rm -rf /tmp/*
