{ config, pkgs, ... }:
{
  services.resolved.enable = true;
  services.openssh.enable = true;

  # dbus-broker is broken in 22.05, fixed in 22.11
  #systemd.packages = [ pkgs.dbus-broker ];
  #systemd.services.dbus-broker.aliases = [ "dbus.service" ];
  #systemd.user.services.dbus-broker.aliases = [ "dbus.service" ];
}
