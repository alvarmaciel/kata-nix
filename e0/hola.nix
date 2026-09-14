let
  pkgs = import <nixpkgs> { };
  script = builtins.toFile "echo_hola.sh" ''
    "$coreutils/bin/ls" -la . > $out
    echo "hola" >> $out  
    '';
in
derivation {
  name = "hola";
  system = "aarch64-darwin";
  builder = "${pkgs.bash}/bin/bash";
  args = [ script ];
  coreutils = pkgs.coreutils;
}
