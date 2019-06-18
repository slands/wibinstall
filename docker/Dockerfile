FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# Standard shell should be bash not dash
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure dash

RUN apt-get update && apt-get install -y \
      dialog \
      apt-utils \
      locales

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y \
      vim \
      sudo \
      devscripts \
      squashfs-tools \
      autoconf \
      automake \
      dpkg-dev \
      syslinux \
      genisoimage \
      lsb-release \
      fakechroot \
      libtool \
      libapt-pkg-dev \
      parted \
      kpartx \
      qemu-system-x86 \
      qemu-utils 

#
# Setup Debian Jessie Backports repository
#
COPY no--check-valid-until /etc/apt/apt.conf.d/
RUN echo "deb http://archive.debian.org/debian/ jessie-backports main" \
      > /etc/apt/sources.list.d/jessie-backports.list

RUN apt-get update && apt-get install -y -t jessie-backports \
      gosu 

#
# Remove Debian Jessie Backports repository
#
RUN rm -f /etc/apt/sources.list.d/jessie-backports.list \
          /etc/apt/apt.conf.d/no--check-valid-until

# Update live-build
RUN echo 'deb http://ftp.debian.org/debian stretch main' | tee -a /etc/apt/sources.list.d/stretch.list && \
    apt-get update && apt-get install -y -t stretch \
      live-build && \
    rm -f /etc/apt/sources.list.d/stretch.list && \
    apt-get update && \
    rm -rf /var/lib/apt/lists/*

# Allow password-less 'sudo' for all users in group 'sudo'
RUN sed "s/^%sudo.*/%sudo\tALL=(ALL) NOPASSWD:ALL/g" -i /etc/sudoers && \
    chmod a+s /usr/sbin/useradd /usr/sbin/groupadd /usr/sbin/gosu /usr/sbin/usermod

# Cleanup
RUN rm -rf /tmp/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY . /docker

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
