{ pkgs, ... }:

let

  service = import ./release.nix { inherit pkgs; };

in

{
  systemd.services.service-a = {
    wantedBy = [ "multi-user.target" ];
    script = "${service}/bin/service-a";
    serviceConfig = {
      DynamicUser = true;
    };
  };

  services.nginx = {
    virtualHosts.localhost = {
      locations = {
        "/service-a/" = {
          proxyPass = "http://127.0.0.1:2000/";
        };
      };
    };
  };
}
