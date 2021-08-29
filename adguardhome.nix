{ sources, lib, stdenv, fetchurl }:

let
  adguardhome = sources.adguardhome;
  version = lib.removePrefix "v" adguardhome.rev;
in
stdenv.mkDerivation {
  pname = "adguardhome";
  inherit version;

  src = fetchurl {
    inherit (adguardhome) url sha256;
  };

  installPhase = ''
    install -m755 -D ./AdGuardHome $out/bin/adguardhome
  '';

  meta = with lib; {
    inherit (adguardhome) description homepage;
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
