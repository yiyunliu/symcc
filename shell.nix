{ pkgs ? import <nixpkgs> {} }:
  with pkgs.buildPackages;
  pkgs.mkShell {
    nativeBuildInputs = 
      [ cmake
        clang_10
        cargo
        git
        llvm_10
        python2
        # (python38.withPackages (ppkgs : with ppkgs; [pip]))
        python
        z3
        zlib
        linuxHeaders
        ninja
        which
        lit
        libffi
        libuuid
        curl
        glibc
        man
      ];
    shellHook = ''
      export UCLIBC_KERNEL_HEADERS=${linuxHeaders}/include
      export CLANG_INCLUDE_DIR=${clang_10.cc.lib}/lib/clang/${clang_10.version}/include
    ''
    ;
}
