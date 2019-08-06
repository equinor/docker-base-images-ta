FROM debian/eol:wheezy

ENV TZ=Europe/Oslo

# Make sure everybody knows we should not be asked anything
ARG DEBIAN_FRONTEND=noninteractive

# Make apt-get not install recommended packages
RUN echo "APT::Get::Install-Recommends "false";" > /etc/apt/apt.conf.d/10-do-not-install-recommended-packages

# Make apt-get always assume that the answer to everything is "yes"
RUN echo "APT::Get::Assume-Yes "true";" > /etc/apt/apt.conf.d/20-assume-yes

# We want wheezy-backports packages, so we add the repository for it
RUN echo "deb http://archive.debian.org/debian wheezy-backports main contrib" >> /etc/apt/sources.list

RUN apt-get update && apt-get install \
    apt-utils \
    build-essential \
    bzr \
    ca-certificates \
    chromium-browser \
    console-setup \
    debconf-utils \
    desktop-file-utils \
    devscripts \
    dialog \
    emacs \
    fakeroot \
    freeglut3-dev \
    gdb \
    gsettings-desktop-schemas \
    git \
    gnome-terminal \
    kate \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    libmpc-dev \
    libpolarssl0 \
    libpolarssl-dev \
    libpulse0 \
    libqt5svg5 \
    libqt5svg5-dev \
    libtool \
    libtxc-dxtn-s2tc-bin \
    libtxc-dxtn-s2tc-dev \
    libtxc-dxtn-s2tc0 \
    libglib2.0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libxcomposite-dev \
    libxv1 \
    libxxf86dga1 \
    locales \
    locate \
    lsof \
    mesa-common-dev \
    mesa-utils \
    nano \
    openssh-server \
    packagekit-gtk3-module \
    raptor2-utils \
    rasqal-utils \
    redland-utils \
    ssh-askpass \
    strace \
    sudo \
    ttf-wqy-zenhei \
    valgrind \
    wget \
    xauth \
    xml-core \
    xorg \
    xvfb \
    x11-utils \
    x11-xserver-utils \
    libuuid1=2.20.1-5.3 liblog4cplus-dev=1.0.4-1 librdf0=1.0.15-1+b1 librdf0-dev=1.0.15-1+b1 uuid-dev=2.20.1-5.3

# Ensure these packages are not automatically upgraded under any circumstance
RUN apt-mark hold libuuid1 liblog4cplus-dev librdf0 librdf0-dev uuid-dev

COPY locale.gen /etc/locale.gen
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# Build cache database of MIME types handled by desktop files
RUN update-desktop-database

# Copy auto-installer script
COPY qt-installer-auto.qs qt-installer-auto.qs

# Download and install Qt with pre-defined answers.
RUN wget https://download.qt.io/archive/qt/5.5/5.5.0/qt-opensource-linux-x64-5.5.0-2.run && \
    chmod +x ./qt-opensource-linux-x64-5.5.0-2.run && \
    xvfb-run -- ./qt-opensource-linux-x64-5.5.0-2.run --script qt-installer-auto.qs && \
    rm qt-opensource-linux-x64-5.5.0-2.run

# Make it easier to search files later
RUN updatedb

# This directory needs to be created manually when sshd is not run as a service.
RUN mkdir -p /var/run/sshd
