{ config, lib, pkgs, modulesPath, ... }:

{
  boot.kernelPackages = pkgs.linuxKernel.packageAliases.linux_latest;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 1;

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.initrd.supportedFilesystems = [ "ext4" ];
  boot.initrd.systemd.enable = true;
  boot.initrd.systemd.root = "gpt-auto";
  boot.initrd.systemd.tpm2.enable = true;
  boot.initrd.luks.forceLuksSupportInInitrd = true;
  boot.initrd.systemd.emergencyAccess = "$y$j9T$IdTz7H.u4VSAfnlGs/6381$VHgm/PZOirdvcHbwPDYCkyxqKkMzIVTczagNp4OuSa1";

  boot.tmp.useTmpfs = true;
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
}
