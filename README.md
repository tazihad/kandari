# Kandari OS
Kandarai OS based on Fedora Atomic.

## Installation
To rebase an existing atomic Fedora installation to the latest build:
- First rebase to the unsigned **Kandari** image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/tazihad/kandari:latest
  ```
- **Nvidia Kandari** unsigned build:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/tazihad/kandari-nvidia:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed **Kandari** image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/tazihad/kandari:latest
  ```
- Or rebase to **Nvidia Kandari** Signed image:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/tazihad/kandari-nvidia:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
