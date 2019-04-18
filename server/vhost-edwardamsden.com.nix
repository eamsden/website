{ pkgs, ...}:
{
  config.services.nginx.virtualHosts."edwardamsden.com" = {
    root = "${pkgs.callPackage ../edwardamsden.com/website.nix {}}";
    serverAliases = [ "edwardamsden.com" "www.edwardamsden.com" ];
  };
}
