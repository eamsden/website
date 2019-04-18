{ pkgs ? import <nixpkgs> {} }:
{
  website = pkgs.callPackage ./website.nix {};
}

