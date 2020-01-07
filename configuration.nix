{ pkgs, ... }:

let

  test-services = pkgs.writeScriptBin "test-services"
    ''
      echo service-a
      ${pkgs.curl}/bin/curl http://localhost/service-a/
      echo
      echo service-b
      ${pkgs.curl}/bin/curl http://localhost/service-b/
      echo
    '';

in

{
  imports = [
    ./service-a/module.nix
    ./service-b/module.nix
  ];

  environment.systemPackages = [ test-services ];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
  users.users.root.password = "root";
}
