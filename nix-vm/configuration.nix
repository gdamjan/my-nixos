# /etc/nixos/configuration.nix

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

  time.timeZone = "Europe/Skopje";

  networking.hostName = "nix-vm";
  networking.useDHCP = false;
  networking.useNetworkd = true;
  networking.interfaces.enp3s0.useDHCP = true;
  services.nscd.enableNsncd = true;
  services.dbus.implementation = "broker";
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
  ];

  system.stateVersion = "22.11";
}
