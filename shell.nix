{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ ];

  shellHook = ''
    export HUGO_HOME=/home/mori/Hikari
    export PATH=/home/mori/.local/bin:$PATH
    export HUGO_BIN=/home/mori/.local/bin/hugo
  '';
}
