FROM mcr.microsoft.com/dotnet/core/aspnet:3.0

# Update all package lists
RUN apt-get update

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -yq nodejs build-essential

# Install System.Drawing native dependencies
RUN apt-get install -yq --allow-unauthenticated \
    libc6-dev \
    libgdiplus \
    libx11-dev \
    && rm -rf /var/lib/apt/lists/*

