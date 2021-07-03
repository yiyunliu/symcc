{ lib, rustPlatform, stdenv, llvm, cmake, cargo, git, python2, z3, zlib, linuxHeaders, ninja, which, lit, libffi, libuuid }:
[ (stdenv.mkDerivation rec {
  name = "symcc";
  src = ./.;
  # doCheck = true;

  buildInputs =
    [ cmake
      llvm
      cargo
      git
      python2
      z3
      zlib
      linuxHeaders
      ninja
      which
      lit
      libffi
      libuuid ];
  cmakeFlags = "-DQSYM_BACKEND=ON";
  
  meta = {
    description = "An efficient compiler-based symbolic executor";
    homepage = https://github.com/eurecom-s3/symcc;
  };
})

  (rustPlatform.buildRustPackage rec {
    pname = "symcc_fuzzing_helper";
    name = pname;
    src = ./util/symcc_fuzzing_helper;
    cargoHash = sha256:1w4f4b11mylkw7j700mpf94bml5il6acr1d50kcdmfzwd6q5gw45;
  })
]
