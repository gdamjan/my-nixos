{ self, pkgs, ... }: {
  time.timeZone = "Europe/Skopje";

  networking.useDHCP = false;
  networking.useNetworkd = true;
  networking.firewall.enable = false;

  services.nscd.enableNsncd = true;
  services.dbus.implementation = "broker";
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
     nix-tree
  ];

  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
  '';

  system.configurationRevision = pkgs.lib.mkIf (self ? rev) self.rev;
  system.stateVersion = "23.11";
}
