let
  pkgs = import <nixpkgs> { };
  script = builtins.toFile "echo_hola.sh" ''
    "$coreutils/bin/ls" -la . > $doc
    echo "hola" > $out
  '';
  paquete = "${pkgs.bash}/bin/bash";
in
derivation {
  name = "hola";
  system = builtins.currentSystem;
  builder = "${paquete}";
  coreutils = pkgs.coreutils;
  outputs = [ "doc" "out" ];
  args = [ script ];
}
