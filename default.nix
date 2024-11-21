let
pkgs = import <nixpkgs> {};
derivation = pkgs.stdenv.mkDerivation;
in
derivation {
	version = "0.1v";
	pname = "createProject";
	buildInputs = with pkgs; [ gcc ];
	src = ./.;
	buildPhase = ''
		mkdir -p bin
		gcc -o bin/createProject src/main.c
	'';
	installPhase = ''
		mkdir -p $out/bin
		cp bin/createProject $out/bin
	'';	
}
