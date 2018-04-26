let
  nixpkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/06c576b0525da85f2de86b3c13bb796d6a0c20f6.tar.gz";
    sha256 = "01cra89drfjf3yhii5na0j5ivap2wcs0h8i0xcxrjs946nk4pp5j";
  }) {};
  ihaskell = builtins.fetchTarball {
    url = "https://github.com/gibiansky/IHaskell/archive/1a8db7b92fc5638b62ced8fb03952b14a9e807f1.tar.gz";
    sha256 = "01r9fp40b1qfdah817csldqpyyszaxla64q41kaa2nb588ah6gg1";
  };
in import "${ihaskell}/release.nix" {
  inherit nixpkgs;
}
