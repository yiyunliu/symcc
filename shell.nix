with import <nixpkgs> {};
mkShell {
  nativeBuildInputs = callPackage ./default.nix
    { stdenv = llvmPackages_10.stdenv;
      llvm = llvmPackages_10.llvm;
    };
}
