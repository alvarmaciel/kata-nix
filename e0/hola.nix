let
  pkgs = import <nixpkgs> { };
  script = builtins.toFile "echo_hola.sh" ''
    "$coreutils/bin/ls" -la . > $out
    echo "hola" >> $out  
    '';
in
derivation {
  name = "hola";
  system = builtins.currentSystem;
  builder = "${pkgs.bash}/bin/bash";
  args = [ script ];
  coreutils = pkgs.coreutils;
}
