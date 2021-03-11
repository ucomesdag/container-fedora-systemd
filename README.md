Fedora Systemd Container Image
=====================

This Containerfile can build containers capable to use systemd.

[![fedore build status](https://quay.io/repository/ucomesdag/fedora/status "Container Repository on Quay")](https://quay.io/repository/ucomesdag/fedora)

Branches
--------

This repository has multiple branches that relate to Fedora versions.

|Branch |Fedora Version|Container image tag|
|-------|--------------|-------------------|
|33     |33            |33                 |
|34     |latest (34)   |34                 |
|main   |latest (35)   |latest             |
|rawhide|rawhide (36)  |rawhide            |

Pull strategy
-------------

The different branches are **not** merged, they live as individual branches.

Manually starting
-----------------

```
podman run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  quay.io/ucomesdag/fedora
```
