# Cloud deployment

Enarx keeps can be deployed to various cloud environments. This document aims to keep track of cloud environments that are known to work, and gotchas.

## General instructions

### SGX

#### Kernel

A Linux kernel with SGX2 support is required (6.0 for upstream).

##### Ubuntu

You can install a new kernel from the [Mainline Kernel repository](https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/) by downloading the linux-modules and linux-image-unsigned packages, and installing them with `dpkg -i`, and rebooting.

##### CentOS / Red Hat Enterprise Linux

You can download a 6.0 or later linux kernel from [Koji, the Fedora buildsystem](https://koji.fedoraproject.org/koji/packageinfo?packageID=8). Download the corresponding kernel, kernel-core, kernel-modules and other rpms, and install with `dnf install ./kernel*.rpm`, and reboot the system.

#### Intel libraries

##### Ubuntu

Follow the instructions of [Intel](https://www.intel.com/content/www/us/en/developer/articles/guide/intel-software-guard-extensions-data-center-attestation-primitives-quick-install-guide.html) to install the repository.
get an API key and install the PCCS service.
Install the DCAP quote library: `apt-get install libsgx-dcap-ql`.

For Azure, do not install the default quote provider library or PCCS service, for other environments, run `apt-get install libsgx-dcap-default-qpl`, and follow the rest of the Intel instructions to get an API key and install the PCCS service.

##### CentOS / Red Hat Enterprise Linux

Download the tarball from [Intel's repository](https://download.01.org/intel-sgx/latest/dcap-latest/linux/distro/centos-stream/), extract it, and create a DNF repo file with contents:
```
[sgx]
baseurl=file://<full-path-here>
```

After this, install `sudo dnf install libsgx-dcap-ql`.

For Azure, do not install the default quote provider library or PCCS service, for other environments, run `sudo dnf module enable nodejs:16 && sudo dnf install sgx-dcap-pccs libsgx-dcap-default-qpl`, and follow the instructions at the [Intel instructions](https://www.intel.com/content/www/us/en/developer/articles/guide/intel-software-guard-extensions-data-center-attestation-primitives-quick-install-guide.html) to get an API key.
After this, run `sudo /opt/intel/sgx-dcap-pccs/install.sh` to configure the PCCS service.

### SEV

A Linux kernel with SEV support is required, this is currently an Enarx-provided kernel with backports.

## Equinix

Available: SGX

Available as pre-release: SEV


## PhoenixNAP

Available: SGX

## Azure

Available: SGX

### SGX

SGX2 is supported on DCsv3 and DCdsv3 instances.
Note that the quota for these instances may be 0, so it may be necessary to get in touch with Microsoft support to get this quota increased.

For attestation, it is important to not install the Intel Quote Provider Library (libsgx-dcap-default-qpl).
Instead, make sure to install the [Azure Data Center Attestation Primitives Client](https://github.com/microsoft/Azure-DCAP-Client).

To do so, find the latest release on the [GitHub releases page](https://github.com/microsoft/Azure-DCAP-Client/releases), and copy the link to the deb file corresponding to your Ubuntu release, download it, and install it with `dpkg -i`.

After this, restart the aesmd service: `systemctl restart aesmd`.

## Amazon Web Services

Available: SEV
