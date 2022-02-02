let
  sources = import ./nix/sources.nix;
  args = { inherit sources; };
in { pkgs ? import sources.nixpkgs { } }: {
  gost = pkgs.callPackage ./gost.nix args;
  adguardhome = pkgs.callPackage ./adguardhome.nix args;
}
