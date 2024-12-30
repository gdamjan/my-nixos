{ config, pkgs, ... }:
{
  services.resolved.enable = true;
  services.openssh.enable = true;

  systemd.services.rqbit = {
    enable = true;
    description = "A streaming bittorrent client in Rust";
    unitConfig = {
      After = "network-online.target";
      Wants = "network-online.target";
    };
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.rqbit}/bin/rqbit server start $DOWNLOAD_DIR";
      DynamicUser = true;
      StateDirectory = "rqbit";
      CacheDirectory = "rqbit";
    };
    environment = {
      XDG_CACHE_HOME = "/var/cache/rqbit";
      XDG_DATA_HOME = "/var/lib/rqbit";
      DOWNLOAD_DIR = "/var/tmp";
      RQBIT_HTTP_API_LISTEN_ADDR = "0.0.0.0:3030";
      RQBIT_UPNP_SERVER_ENABLE = "true";
      RQBIT_LOG_LEVEL_CONSOLE = "warn";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
