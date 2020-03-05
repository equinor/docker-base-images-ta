FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ARG NODE_VERSION=12
ARG CHROMIUM_REVISION=706915

# Update all package lists
# Install Node
# Install System.Drawing native dependencies
# Install Chromium so that it is available under /app/.local-chromium
RUN apt-get update && \
  curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential && \
  npm install -g yarn && \
  apt-get install -yq --allow-unauthenticated \
  libc6-dev \
  libgdiplus \
  libx11-dev \
  unzip && \
  wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROMIUM_REVISION}/chrome-linux.zip && \
  mkdir -p /app/.local-chromium/Linux-${CHROMIUM_REVISION} && \
  unzip chrome-linux.zip -d /app/.local-chromium/Linux-${CHROMIUM_REVISION} && \
  rm chrome-linux.zip && \
  apt-get -yq remove --purge unzip && \
  rm -rf /var/lib/apt/lists/*
