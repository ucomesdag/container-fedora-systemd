FROM fedora:41

ARG BUILD_DATE

LABEL summary="Fedora Systemd Container Image."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

ENV container=podman

# Enable systemd and install required packages.
RUN dnf -y install systemd python3 python3-libdnf5 && dnf clean all && \
  (cd /lib/systemd/system/sysinit.target.wants/ ; for i in * ; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i ; done) ; \
  rm -f /lib/systemd/system/multi-user.target.wants/* ;\
  rm -f /etc/systemd/system/*.wants/* ;\
  rm -f /lib/systemd/system/local-fs.target.wants/* ; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
  rm -f /lib/systemd/system/basic.target.wants/* ;\
  rm -f /lib/systemd/system/anaconda.target.wants/*

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
