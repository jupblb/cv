{
  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem(
    system:
      let
        pkgs      = nixpkgs.legacyPackages.${system};
        texlive   = pkgs.texlive.combine({
          inherit (pkgs.texlive) scheme-small titlesec sourcesanspro
            fontawesome5 enumitem ly1;
        });
        pythonEnv = pkgs.python3.withPackages(ps: [ ps.pymupdf ]);
      in {
        devShells.default = pkgs.mkShell({
          buildInputs = with pkgs;
            [ gnumake gnused pandoc poppler_utils pythonEnv texlive ];
        });
      }
    );
}
