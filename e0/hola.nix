let
  pkgs = import <nixpkgs> { };
  script = builtins.toFile "echo_hola.sh" ''
    "$coreutils/bin/ls" -la . > $doc
    echo "hola" > $out
    '';
in
derivation {
  name = "hola";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  outputs = [ "doc" "out" ];
  args = [ script ];
  coreutils = pkgs.coreutils;
}
