let
  nixpkgs = import <nixpkgs> {};
  inherit (nixpkgs) stdenv callPackage;
in
  callPackage ./default.nix {
    inherit stdenv;
  }
