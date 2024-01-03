{ config, pkgs, ... }:

{
  boot.kernel.enable = false;
  boot.modprobeConfig.enable = false;
  console.enable = false;
  nix.optimise.automatic = false; # the store is host managed
  powerManagement.enable = false;
  documentation.nixos.enable = false;
  security.audit.enable = false;

  boot.loader.initScript.enable = true;
  system.build.installBootLoader = "${pkgs.coreutils}/bin/true";

  time.timeZone = "Europe/Skopje";

  networking.hostName = "nix-container";
}
