FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

ARG NODE_VERSION=12
ARG CHROMIUM_REVISION=706915

# Install Node
# Add package source necessary for ttf-mscorefonts-installer and install it
# Install dependencies: packages essential for building as well as System.Drawing native dependencies
# Ensure we have a fresh /etc/fonts and fontconfig
# Install Chromium so that it is available under /app/.local-chromium
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
  echo "deb http://deb.debian.org/debian buster contrib non-free" >> /etc/apt/sources.list && \
  apt-get update && \
  apt-get -yq install ttf-mscorefonts-installer && \
  apt-get install -yq build-essential && \
  apt-get install -yq --allow-unauthenticated \
  libc6-dev \
  libgdiplus \
  libx11-dev \
  unzip && \
  rm -rf /etc/fonts && \
  apt-get install -yq fontconfig && \
  wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROMIUM_REVISION}/chrome-linux.zip && \
  mkdir -p /app/.local-chromium/Linux-${CHROMIUM_REVISION} && \
  unzip chrome-linux.zip -d /app/.local-chromium/Linux-${CHROMIUM_REVISION} && \
  rm chrome-linux.zip && \
  apt-get -yq remove --purge unzip && \
  rm -rf /var/lib/apt/lists/*
