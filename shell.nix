{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake
    gnused
    pandoc
    (texlive.combine { inherit (texlive) scheme-small titlesec; })
  ];
}
