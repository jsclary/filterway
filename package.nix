{ pkgs, lib }:
let
  fenix = import (fetchTarball "https://github.com/nix-community/fenix/archive/480c95c3c9ca478e857f7153639010fb54ec73e8.zip") { };
  naersk = pkgs.callPackage (fetchTarball "https://github.com/nix-community/naersk/archive/378614f37a6bee5a3f2ef4f825a73d948d3ae921.zip") (
    let
      toolchain = fenix.combine [
        fenix.latest.rustc
        fenix.latest.cargo
      ];
    in
    {
      rustc = toolchain;
      cargo = toolchain;
    }
  );
in
naersk.buildPackage {
  root = ./.;
}
