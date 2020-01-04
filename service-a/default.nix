{ pkgs, writeShellScriptBin }:

let

  python = pkgs.python3.withPackages (p: with p; [ flask ]);

  src = ./a.py;

in

  writeShellScriptBin "service-a" ''
    ${python}/bin/python ${src}
    ''
