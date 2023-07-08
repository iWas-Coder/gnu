[//]: # (Title of the project)

<img src="assets/logo.png" alt="Robby" width=400/>

# Robby: A GNU system & dotfiles definition

[//]: # (GPLv3 License indicator)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)

[//]: # (README Body)

(...)

## Table of Contents

- [Installation](#installation)
    - [Disks partitioning](#disks-partitioning)

## Installation

Installation guide of a distribution of the GNU system, managed through the GNU Guix package manager, and completely defined and programmed in GNU Guile.

(...)

### Disks partitioning

(...)

```shell
$  cfdisk /dev/$DISK1
```

(...)

| LABEL | MOUNTPOINT | PARTITION TYPE   | FORMAT | SIZE |
|-------|------------|------------------|--------|------|
| EFI   | /boot/EFI  | EFI System       | fat32  | 128M |
| BOOT  | /boot      | Linux filesystem | ext4   | 896M |
| SYS   | /          | Linux filesystem | ext4   | REST |

(...)

```shell
$  cfdisk /dev/$DISK2
```

(...)

| LABEL | MOUNTPOINT       | PARTITION TYPE   | FORMAT | SIZE |
|-------|------------------|------------------|--------|------|
| DATA  | /home/$USER/data | Linux filesystem | ext4   | ALL  |

(...)

