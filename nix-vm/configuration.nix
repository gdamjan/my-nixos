{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [
    "console=ttyS0,115200"
    "console=tty1"
  ];

  networking.hostName = "nix-vm";
  networking.interfaces.enp3s0.useDHCP = true;
}
