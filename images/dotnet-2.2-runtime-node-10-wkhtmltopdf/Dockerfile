FROM microsoft/dotnet:2.2-aspnetcore-runtime

# Update all package lists
RUN apt-get update

# Install wget for easy downloading of other files
RUN apt-get install -yq wget

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -yq nodejs build-essential

# Install wkhtmltox (provides wkhtmltopdf command)
RUN wget --no-check-certificate https://builds.wkhtmltopdf.org/0.12.6-dev/wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.stretch_amd64.deb
RUN apt install -yq ./wkhtmltox_0.12.6-0.20180618.3.dev.e6d6f54.stretch_amd64.deb

# Install System.Drawing native dependencies
RUN apt-get install -yq --allow-unauthenticated \
       libc6-dev \
       libgdiplus \
       libx11-dev \
    && rm -rf /var/lib/apt/lists/*

# Remove wget
RUN apt-get remove -yq wget
