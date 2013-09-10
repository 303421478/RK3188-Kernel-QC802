Linux 3.0.36+ for RK3188 devices

=========

- Runs fine on production server: http://my.finance5.de/sysinfo/index.php
- Tested with Debian Wheezy linuxroot (not Picuntu)
- Supports DM9601, Asix any many more USB Ethernet adapters with working DHCP functionality!
- 500MHz DDR3.
- Support for PL2302 and CH341 USB<->RS232 adapters included.
- Many kernel modules for all types of hardware.

Build environment: CentOS 6.4, but known to work on Ubuntu 12.04 and Debian 7.10 also.

Target device: QC802 with AP6210 wireless chipset.

Ready to flash recovery image (ARM-hf) to use with RK Android Tool flash tool: recovery-qc802.img

Kernel modules and firmware to put into linuxroot sdcard is found in folder: mod_fw



