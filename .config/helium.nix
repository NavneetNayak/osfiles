{ pkgs }:
pkgs.appimageTools.wrapType2 rec {
  pname = "helium";
  version = "0.11.1.1";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/${pname}-${version}-arm64.AppImage";
    sha256 = "sha256-5KKQX9W5ImvWbKon6jrqGUOLincZ5RwuZPWotHQoKvQ=";
  };

  extraInstallCommands =
    let
      contents = pkgs.appimageTools.extract { inherit pname version src; };
    in
    ''
      install -m 444 -D ${contents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace 'Exec=AppRun' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';
}
