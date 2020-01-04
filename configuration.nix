{ ... }:

{
  imports = [
    ./service-a/module.nix
  ];

  users.users.root.password = "root";
}
