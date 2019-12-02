FROM mcr.microsoft.com/dotnet/core/sdk:3.0

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
