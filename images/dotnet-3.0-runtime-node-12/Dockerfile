FROM mcr.microsoft.com/dotnet/core/aspnet:3.0

ARG NODE_VERSION=12

# Update all package lists
# Install Node
# Install Chromium
# Install System.Drawing native dependencies
RUN apt-get update && \
   curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential && \
   apt-get install -yq --allow-unauthenticated \
   libc6-dev \
   libgdiplus \
   libx11-dev \
   chromium 

RUN mv /etc/fonts /etc/fonts_bak
RUN apt-get install fontconfig \
   && rm -rf /var/lib/apt/lists/*
