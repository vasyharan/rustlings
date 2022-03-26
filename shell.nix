{ pkgs ? import <nixpkgs> {} }:
  let
    frameworks = pkgs.darwin.apple_sdk.frameworks;
  in
    pkgs.mkShell rec {
      buildInputs = with pkgs; [
        rustc
        cargo
        rustfmt
        rust-analyzer
        clippy

        # build deps
        libiconv
        frameworks.CoreServices
      ];
      shellHook = ''
        export PATH=./target/release:$PATH
        export RUST_BACKTRACE=1
      '';
    }
