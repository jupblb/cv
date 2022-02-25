{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    pandoc
    (texlive.combine { inherit (texlive) scheme-small titlesec; })
  ];
}





