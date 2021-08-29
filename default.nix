let
  sources = import ./nix/sources.nix;
  packages = pkgs: {
    gost = pkgs.callPackage ./gost.nix { inherit sources; };
    adguardhome = pkgs.callPackage ./adguardhome.nix { inherit sources; };
  };
in
{ pkgs ? null }:
if builtins.isNull pkgs then
  let
    overlay = self: super: {
      inherit sources;
      inherit (import sources.niv { }) niv;
    } // (packages super);
  in
  import sources.nixpkgs
  {
    overlays = [ overlay ];
    config = { };
  }
else
  packages pkgs
