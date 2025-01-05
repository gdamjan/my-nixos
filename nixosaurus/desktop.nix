{ config, pkgs, ... }:
let
  desktop-session = pkgs.writeShellScript "desktop-session" ''
    exec nix run --offline ~/desktop
  '';
in
{
  services.displayManager.ly = {
    enable = true;
  };

  hardware.graphics.extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = { General = { Experimental=true; }; };
  security.rtkit.enable = true;
  services.dbus.implementation = "broker";
  services.power-profiles-daemon.enable = true;
  services.udisks2.enable = true;
  services.hardware.bolt.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;
  #xdg.portal.gtkUsePortal = true;

  programs.sway.enable = true;

  fonts.enableDefaultPackages = false;
  fonts.packages = with pkgs; [
    dejavu_fonts
    font-awesome
    material-icons
    noto-fonts-emoji
    roboto
  ];
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    glib
    dconf
  ];
}
