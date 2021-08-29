{ sources, pkgs, lib, buildGoModule }:

let
  gost = sources.gost;
  version = lib.removePrefix "v" gost.rev;
in
buildGoModule {
  pname = "gost";
  inherit version;

  src = gost;

  vendorSha256 = "1cgb957ipkiix3x0x84c77a1i8l679q3kqykm1lhb4f19x61dqjh";

  doCheck = false;

  subPackages = [ "cmd/gost" ];

  meta = with lib; {
    inherit (gost) description homepage;
    license = licenses.mit;
    platforms = platforms.linux ++ platforms.darwin;
  };
}
