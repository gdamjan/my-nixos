{ config, pkgs, lib, ... }:

{
  boot.isContainer = true;
  boot.kernel.enable = false;
  boot.modprobeConfig.enable = false;
  boot.loader.initScript.enable = true;

  networking.hostName = "nix-container";
  networking.useHostResolvConf = false;
  services.openssh.startWhenNeeded = false;
  services.udev.enable = lib.mkForce true;
  # environment.variables.NIX_REMOTE = "";

  nix.settings.sandbox = false;
}
