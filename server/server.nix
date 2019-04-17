{ config, lib, pkgs, ...}:
with lib;
{
  imports = [ <nixpkgs/nixos/modules/virtualisation/digital-ocean-config.nix> ];
  config = {
    networking.hostName="edwardamsden-webserver";
    networking.firewall.allowedTCPPorts = [ 22 80 ];

    virtualisation.digitalOcean.seedEntropy = false;

    services.nginx = {
      enable = true;
      virtualHosts = {
        "edwardamsden.com" = {
          root = "${pkgs.website}";
          serverAliases = [ "edwardamsden.com" "www.edwardamsden.com" ];
        };
      };
    };

    nixpkgs.overlays = [ (self: super: { website = self.callPackage ../website.nix {}; }) ];
  };
}
