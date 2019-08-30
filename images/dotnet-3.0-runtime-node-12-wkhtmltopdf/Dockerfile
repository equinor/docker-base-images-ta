FROM mcr.microsoft.com/dotnet/core/aspnet:3.0.0-preview5

ARG NODE_VERSION=12

# Update all package lists
# Install Node
# Install wkhtmltox (provides wkhtmltopdf command)
# Install System.Drawing native dependencies
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential && \
    curl --insecure https://builds.wkhtmltopdf.org/0.12.6-dev/wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.stretch_amd64.deb -o wkhtmltox.deb && \
    apt install -yq ./wkhtmltox.deb && \
    rm ./wkhtmltox.deb && \
    apt-get install -yq --allow-unauthenticated \
       libc6-dev \
       libgdiplus \
       libx11-dev \
    && rm -rf /var/lib/apt/lists/*
