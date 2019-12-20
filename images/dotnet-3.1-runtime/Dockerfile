FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

# Update all package lists
# Install Chromium
# Install System.Drawing native dependencies
RUN apt-get update && \
   apt-get install -yq --allow-unauthenticated
   libc6-dev \
   libgdiplus \
   libx11-dev \
   chromium && \
   rm -rf /etc/fonts && \
   apt-get install fontconfig \
   && rm -rf /var/lib/apt/lists/*
