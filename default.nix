let
  sources = import ./nix/sources.nix;
  packages = pkgs: { };
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
