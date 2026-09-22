let
  pkgs = import <nixpkgs> {  };
in
derivation{
  name = "curl";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  curl = pkgs.curl;
  args = [ "-c" "$curl/bin/curl -i https://paramastarde.ar/inicio > $out"];

}
