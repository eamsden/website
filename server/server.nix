{ config, lib, pkgs, ...}:
with lib;
{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/digital-ocean-config.nix>
    ./vhost-edwardamsden.com.nix
    ./vhost-blackriversoft.com.nix
  ];
  config = {
    networking.hostName="edwardamsden-website";
    networking.firewall.allowedTCPPorts = [ 22 80 ];

    virtualisation.digitalOcean.seedEntropy = false;

    services.nginx.enable = true;
  };
}
