# Unifi Controller on ARM64

This role is for setting up a Ubiquiti Unifi Controller on ARM64 Ubuntu building on the [official docs](https://help.ui.com/hc/en-us/articles/220066768-UniFi-How-to-Install-and-Update-via-APT-on-Debian-or-Ubuntu)

## Notes

Unfortunately Unifi Controller relies on some pretty outdated packages, making them hard to find in recent Linux distributions. Specifically, the following packages need to be backported:

- Mongo 3.6
- libssl1.1

By specifying arm64 in the Xenial Mongo 3.6 apt repo, the
