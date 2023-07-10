[//]: # (Title of the project)

<img src="assets/logo.png" alt="Robby" width=50%/>

# GNU: "GNU's Not UNIX!"

[//]: # (GPLv3 License indicator)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)

[//]: # (README Body)

(...)

## Table of Contents

- [Installation](#installation)
    - [Image build](#image-build)
    - [Disks partitioning](#disks-partitioning)
    - [Partitions formatting](#partitions-formatting)
    - [GNU System instantiation](#gnu-system-instantiation)

## Installation

Installation guide of a distribution of the GNU system, managed through the GNU Guix package manager, and completely defined and programmed in GNU Guile.

(...)

### Image build

(...)

```shell
git clone "https://github.com/iwas-coder/gnu"
```

(...)

```shell
guix time-machine -C gnu/channels.scm -- \
     system image -t iso9660 gnu/install.scm
```

(...)

### Disks partitioning

(...)

```shell
cfdisk /dev/nvme0n1
```

(...)

| LABEL | MOUNTPOINT | PARTITION TYPE   | FORMAT | SIZE |
|-------|------------|------------------|--------|------|
| EFI   | /boot/EFI  | EFI System       | fat32  | 128M |
| BOOT  | /boot      | Linux filesystem | ext4   | 896M |
| SYS   | /          | Linux filesystem | ext4   | REST |

(...)

```shell
cfdisk /dev/nvme1n1
```

(...)

| LABEL | MOUNTPOINT       | PARTITION TYPE   | FORMAT | SIZE |
|-------|------------------|------------------|--------|------|
| DATA  | /home/$USER/data | Linux filesystem | ext4   | ALL  |

(...)

### Partitions formatting

(...)

```shell
mkfs.vfat -F 32 -n EFI /dev/nvme0n1p1
```

(...)

```shell
mkfs.ext4 -L BOOT /dev/nvme0n1p2
```

(...)

```shell
mkfs.ext4 -L SYS /dev/nvme0n1p3
```

(...)

```shell
mkfs.ext4 -L DATA /dev/nvme1n1p1
```

(...)

```shell
mount -L SYS /mnt
```

### GNU System instantiation

(...)

```shell
git clone "https://github.com/iwas-coder/gnu"
```

(...)

```shell
herd start cow-store /mnt
```

(...)

```shell
guix system init gnu/system.scm /mnt
```

(...)
