{ pkgs ? import <nixpkgs> {}, ... }:

let

  pkg = pkgs.haskellPackages.callCabal2nix "service-b" ./. {};

in

  if pkgs.lib.inNixShell then pkg.env else pkg
