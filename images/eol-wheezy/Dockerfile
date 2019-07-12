FROM debian/eol:wheezy

RUN echo "APT::Get::Install-Recommends "false";" > /etc/apt/apt.conf.d/10-do-not-install-recommended-packages
RUN echo "APT::Get::Assume-Yes "true";" > /etc/apt/apt.conf.d/20-assume-yes
RUN echo "deb http://archive.debian.org/debian wheezy-backports main contrib" >> /etc/apt/sources.list

# Wheezy package repositories are now outdated (404 not found).
RUN apt-get update

RUN apt-get install \
    apt-utils \
    build-essential \
    ca-certificates \
    chromium-browser \
    debconf-utils \
    devscripts \
    dialog \
    emacs \
    fakeroot \
    freeglut3-dev \
    gdb \
    gsettings-desktop-schemas \
    git \
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
    lsof \
    mesa-common-dev \
    mesa-utils \
    nano \
    openssh-server \
    packagekit-gtk3-module \
    raptor2-utils \
    rasqal-utils \
    redland-utils \
    strace \
    sudo \
    ttf-wqy-zenhei \
    valgrind \
    xauth \
    xml-core \
    xorg \
    xvfb \
    x11-utils \
    x11-xserver-utils

COPY locale.gen /etc/locale.gen
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# This directory needs to be created manually when sshd is not run as a service.
RUN mkdir -p /var/run/sshd
