FROM mcr.microsoft.com/dotnet/core/sdk:3.0

# Install Node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -yq nodejs build-essential

# Install Yarn
RUN npm install -g yarn

# Install System.Drawing native dependencies
RUN apt-get install -yq --allow-unauthenticated \
   libc6-dev \
   libgdiplus \
   libx11-dev \
   && rm -rf /var/lib/apt/lists/*
