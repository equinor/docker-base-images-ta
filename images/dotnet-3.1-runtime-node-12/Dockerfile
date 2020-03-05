FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

ARG NODE_VERSION=12
ARG CHROMIUM_REVISION=706915

RUN echo "deb http://deb.debian.org/debian buster contrib non-free" >> /etc/apt/sources.list

# Update all package lists
# Install Node
# Install Chromium
# Install System.Drawing native dependencies
RUN apt-get update && \
  apt-get -yq install ttf-mscorefonts-installer && \
  curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential && \
  apt-get install -yq --allow-unauthenticated \
  libc6-dev \
  libgdiplus \
  libx11-dev \
  chromium && \
  rm -rf /etc/fonts && \
  apt-get install fontconfig \
  && rm -rf /var/lib/apt/lists/*

# Install Chromium so that it is available under /app/.local-chromium
WORKDIR /app
RUN wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROMIUM_REVISION}/chrome-linux.zip && \
  mkdir -p .local-chromium/Linux-${CHROMIUM_REVISION} && \
  unzip chrome-linux.zip -d .local-chromium/Linux-${CHROMIUM_REVISION} && \
  rm chrome-linux.zip
