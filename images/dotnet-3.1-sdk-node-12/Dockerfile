FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ARG NODE_VERSION=12

# Update all package lists
# Install Node
# Install System.Drawing native dependencies
RUN apt-get update && \
   curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential && \
   npm install -g yarn && \
   apt-get install -yq --allow-unauthenticated \
   libc6-dev \
   libgdiplus \
   libx11-dev \
   unzip \
   && rm -rf /var/lib/apt/lists/*

# Install Chromium so that it is available under /app/.local-chromium
WORKDIR /app
RUN wget https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROMIUM_REVISION}/chrome-linux.zip && \
  mkdir -p .local-chromium/Linux-${CHROMIUM_REVISION} && \
  unzip chrome-linux.zip -d .local-chromium/Linux-${CHROMIUM_REVISION} && \
  rm chrome-linux.zip
