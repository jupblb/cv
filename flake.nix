{
  inputs = {
    nixpkgs.url     = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem(
    system:
      let
        pkgs    = nixpkgs.legacyPackages.${system};
        texlive = pkgs.texlive.combine({
          inherit (pkgs.texlive) scheme-small titlesec;
        });
      in {
        devShells.default = pkgs.mkShell({
          buildInputs = with pkgs; [ gnumake gnused pandoc texlive ];
        });
      }
    );
}
