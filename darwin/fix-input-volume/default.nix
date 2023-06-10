{ stdenv }:

stdenv.mkDerivation rec {
  pname = "fix-input-volume";
  version = "0.0.1";

  src = ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp fix-input-volume.sh $out/bin/fix-input-volume.sh
    chmod +x $out/bin/fix-input-volume.sh

    mkdir -p $out/share/fix-input-volume
    cp fix-input-volume.plist $out/share/fix-input-volume/fix-input-volume.plist
  '';

  meta = {
    description = "Affix microphone input volume, overriding auto-gain features";
  };
}
