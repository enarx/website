# Cloud deployment

Enarx keeps can be deployed to various cloud environments. This document aims to keep track of cloud environments that are known to work, and gotchas.

# Cloud Support

|                             | AMD SEV-SNP | Intel SGX2 | Instances / Notes                                          |
|-----------------------------|-------------|------------|----------------------------------------------------------|
| [AWS](#amazon-web-services) | ✅           | ❌          | `m6a.metal` **DO NOT** install the Intel QPL (see below) |
| [Azure](#azure)             | ❌           | ✅          | `DCsv3` `DCdsv3`                                         |
| [Equinix](#equinix)         | ✅           | ✅          | `n3.xlarge` `m3.large.opt-c2m3s3` `c3.medium.opt-c1m1`   |
| [IBM Cloud](#ibm-cloud)     | ❓           | ❓          |                                                          |
| [PhoenixNAP](#phoenixnap)   | ❌           | ✅          | Multiple Instances (see CSP documentation)               |

# General instructions

## CPU Support

The following chart is the quickest way to make a good guess if a CPU is supported or not. This heuristic is **NOT** perfect. So please consult the charts below and your hardware vendor.

|                     | RegEx       | Example Supported | Example Unsupported |
|---------------------|-------------|-------------------|---------------------|
| AMD EPYC            | `7..3.?`    | 7543 7443P 7373X  | 7302 7F72 7351P     |
| Intel Xeon Scalable | `[4568]3.+` | 8380 5315Y 6338T  | 5218R 4209T 6240    |

### AMD

![milan](https://www.servethehome.com/wp-content/uploads/2021/03/AMD-EPYC-7003-Models.jpg)

### Intel

![xeon](https://www.servethehome.com/wp-content/uploads/2021/04/3rd-Generation-Intel-Xeon-Scalable-SKU-Stack-April-2021.jpg)

## Kernel Support

### AMD SEV-SNP

A Linux kernel with SEV-SNP support is required. As this driver is not yet available upstream, Profian can provide a kernel build for your Linux distribution.

### Intel SGX

SGX2 support is required. The good news is that SGX2 support is now available in the `6.0.0` kernel or later. If your Linux distribution does not provide this kernel version yet, there are several ways to upgrade.

#### Ubuntu

You can install a new kernel from the [Mainline Kernel repository](https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/) by downloading the linux-modules and linux-image-unsigned packages, and installing them with `dpkg -i`, and rebooting.

#### CentOS / Red Hat Enterprise Linux

You can download a 6.0 or later linux kernel from [Koji, the Fedora buildsystem](https://koji.fedoraproject.org/koji/packageinfo?packageID=8). Download the corresponding kernel, kernel-core, kernel-modules and other rpms, and install with `dnf install ./kernel*.rpm`, and reboot the system.

## Other Software

### Ubuntu

Follow the instructions of [Intel](https://www.intel.com/content/www/us/en/developer/articles/guide/intel-software-guard-extensions-data-center-attestation-primitives-quick-install-guide.html) to install the repository.
get an API key and install the PCCS service.
Install the DCAP quote library: `apt-get install libsgx-dcap-ql`.

For Azure, do not install the default quote provider library or PCCS service, for other environments, run `apt-get install libsgx-dcap-default-qpl`, and follow the rest of the Intel instructions to get an API key and install the PCCS service.

### CentOS / Red Hat Enterprise Linux

Download the tarball from [Intel's repository](https://download.01.org/intel-sgx/latest/dcap-latest/linux/distro/centos-stream/), extract it, and create a DNF repo file with contents:
```
[sgx]
baseurl=file://<full-path-here>
```

After this, install `sudo dnf install libsgx-dcap-ql`.

For Azure, do not install the default quote provider library or PCCS service, for other environments, run `sudo dnf module enable nodejs:16 && sudo dnf install sgx-dcap-pccs libsgx-dcap-default-qpl`, and follow the instructions at the [Intel instructions](https://www.intel.com/content/www/us/en/developer/articles/guide/intel-software-guard-extensions-data-center-attestation-primitives-quick-install-guide.html) to get an API key.
After this, run `sudo /opt/intel/sgx-dcap-pccs/install.sh` to configure the PCCS service.

## Amazon Web Services

|             |   | Instances   | Notes                                    |
|-------------|---|-------------|------------------------------------------|
| AMD SEV-SNP | ✅ | `m6a.metal` | Contact Profian for a supported kernel. |
| Intel SGX2  | ❌ |             |                                         |

## Azure

|             |   | Instances        | Notes                                                 |
|-------------|---|------------------|-------------------------------------------------------|
| AMD SEV-SNP | ❌ |                  |                                                       |
| Intel SGX2  | ✅ | `DCsv3` `DCdsv3` | 6.0.0+ kernel required. **DO NOT** install Intel QPL. |

### Quota

Note that the quota for these instances may be 0. It may be necessary to contact Microsoft support to increase your quota.

### Attestation

Azure provides their own certificate caching infrastructure. Attempting to use the Intel Quote Provider Library (QPL) will fail.

- **DO NOT** install the Intel Quote Provider Library (`libsgx-dcap-default-qpl`).

- Instead, make sure to install the [Azure Data Center Attestation Primitives Client](https://github.com/microsoft/Azure-DCAP-Client).

  1. Find the latest release on the [GitHub releases page](https://github.com/microsoft/Azure-DCAP-Client/releases),
  2. Copy the link to the deb file corresponding to your Ubuntu release.
  3. Download the `.deb` file.
  4. Install it with `dpkg -i`.
  5. Restart the aesmd service: `systemctl restart aesmd`.

## Equinix

|             |   | Instances                                  | Notes                                    |
|-------------|---|--------------------------------------------|------------------------------------------|
| AMD SEV-SNP | ✅ | `m3.large.opt-c2m3s3` `c3.medium.opt-c1m1` | Contact Profian for a supported kernel. |
| Intel SGX2  | ✅ | `n3.xlarge`                                | 6.0.0+ kernel required. See above.      |

### Availability

Not all instances are available by default to all customers. For access to the above instances, you may need to contact Equinix directly.

## PhoenixNAP

|             |   | Instances      | Notes                               |
|-------------|---|----------------|-------------------------------------|
| AMD SEV-SNP | ❌ |                |                                    |
| Intel SGX2  | ✅ | Many. See CSP. | 6.0.0+ kernel required. See above. |


