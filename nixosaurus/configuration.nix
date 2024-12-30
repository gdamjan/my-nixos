{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./services.nix
      ./desktop.nix
    ];

  networking.hostName = "nixosaurus";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.settings.device."wifi.iwd.autoconnect" = "yes";
  networking.wireless.iwd.enable = true;
  networking.firewall.enable = false;

  services.logind.lidSwitch = "ignore";

  services.nscd.enableNsncd = true;

  i18n.defaultLocale = "en_GB.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.damjan = {
    createHome = false;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      git
      tmux
    ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJeHvI5nYLPpBaMTRny9XFouOZSrwkYGSUWFd8i1OP1Q damjan@lokutis" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    nix-tree
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "22.11";
}
