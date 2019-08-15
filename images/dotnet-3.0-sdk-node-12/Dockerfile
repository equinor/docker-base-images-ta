FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100-preview5

ARG NODE_VERSION=12

ENV SuppressNETCoreSdkPreviewMessage=true

# Update all package lists
RUN apt-get update

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && apt-get install -yq nodejs build-essential

# Install Yarn
RUN npm install -g yarn

# Install wkhtmltox (provides wkhtmltopdf command)
RUN wget --no-check-certificate https://builds.wkhtmltopdf.org/0.12.6-dev/wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.stretch_amd64.deb
RUN apt install -yq ./wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.stretch_amd64.deb

# Install System.Drawing native dependencies
RUN apt-get install -yq --allow-unauthenticated \
       libc6-dev \
       libgdiplus \
       libx11-dev \
    && rm -rf /var/lib/apt/lists/*
