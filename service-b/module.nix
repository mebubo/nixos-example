{ pkgs, ... }:

let

  service = import ./release.nix { inherit pkgs; };

in

{
  systemd.services.service-b = {
    wantedBy = [ "multi-user.target" ];
    script = "${service}/bin/service-b";
    serviceConfig = {
      DynamicUser = true;
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts.localhost = {
      locations = {
        "service-b" = {
          proxyPass = "http://localhost:8081";
        };
      };
    };
  };
}
