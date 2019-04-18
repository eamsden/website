{lib, stdenv}:
stdenv.mkDerivation {
  name = "edwardamsden.com";
  src = lib.cleanSource (lib.cleanSourceWith { filter = (name: type: name != "result" && name != "server"); src = ./.;});
  installPhase=''
    mkdir -p $out/
    cp -R * $out/
    '';
}

