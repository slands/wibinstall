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

RUN apt-get update && apt-get install -y live-build && \
    rm -rf /var/lib/apt/lists/*

# Cleanup
RUN rm -rf /tmp/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY . /docker

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
