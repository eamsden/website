{ pkgs, ...}:
{
  config.services.nginx.virtualHosts."blackriversoft.com" = {
    root = "${pkgs.callPackage ../blackriversoft.com/website.nix {}}";
    serverAliases = [ "blackriversoft.com" "www.blackriversoft.com" ];
  };
}
