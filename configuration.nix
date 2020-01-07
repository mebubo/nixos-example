{ ... }:

{
  imports = [
    ./service-a/module.nix
    ./service-b/module.nix
  ];

  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
  users.users.root.password = "root";
}
