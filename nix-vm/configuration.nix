{ config, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/profiles/qemu-guest.nix")
    ];
  networking.hostName = "nix-vm";
  networking.interfaces.enp3s0.useDHCP = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "ehci_pci" "sd_mod" "sr_mod" ];
  boot.initrd.supportedFilesystems = [ "ext4" ];

  boot.initrd.systemd.emergencyAccess = "$y$j9T$IdTz7H.u4VSAfnlGs/6381$VHgm/PZOirdvcHbwPDYCkyxqKkMzIVTczagNp4OuSa1";

  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.root = "gpt-auto";
  boot.initrd.systemd.repart.enable  = true;
  boot.initrd.systemd.repart.device = "/dev/sda";
  boot.kernelParams = [
    "console=ttyS0,115200"
    "console=tty1"
  ];
}
