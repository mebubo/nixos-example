{ configuration ? ./configuration.nix }:

# http://www.haskellforall.com/2018/08/nixos-in-production.html
let

  nixos = import <nixpkgs/nixos>;

  withImports = imports: nixos {
    system = "x86_64-linux";
    configuration = { imports = [ configuration ] ++ imports; };
  };

  isoImage = import <nixpkgs/nixos/modules/installer/cd-dvd/iso-image.nix>;

  isoMultiBoot = { ... }: {
    isoImage = {
      makeEfiBootable = true;
	  makeUsbBootable = true;
    };
  };

in

  {
    vm = (withImports []).vm;
    iso = (withImports [ isoImage isoMultiBoot ]).config.system.build.isoImage;
  }
