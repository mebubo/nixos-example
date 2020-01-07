{ ... }:

{
  imports = [
    ./service-a/module.nix
    ./service-b/module.nix
  ];

  users.users.root.password = "root";
}
