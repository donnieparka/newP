{
  description = "create a new project and already creato boilerplates";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    src.url = "github:donnieparka/newP";
    src.flake = false;
  };

  outputs = { self, nixpkgs, src }: 
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux; 
    in
      {
      packages.x86_64-linux = {
        newP = with pkgs;
          stdenv.mkDerivation {
          pname = "newP";
          version = "0.1";
          src = src;
          buildPhase = ''
            mkdir -p bin
            gcc -o bin/newP src/main.c
          '';
          installPhase = ''
            mkdir -p $out/bin
            cp bin/newP $out/bin/newP
          '';
        };
    default = self.packages.x86_64-linux.newP;
    };
  };
}
