# /etc/nixos/configuration.nix

{ config, pkgs, ... }:

{
  imports = [];

  boot.isContainer = true;
  boot.loader.initScript.enable = true;

  time.timeZone = "Europe/Skopje";

  networking.hostName = "nix-container";
  networking.useDHCP = false;
  networking.useNetworkd = true;
  networking.useHostResolvConf = false;
  networking.firewall.enable = false;

  services.dbus.implementation = "broker";
  services.sshd.enable = true;

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
  ];


  nix.settings.sandbox = false;
  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';

  system.stateVersion = "21.11";
}
