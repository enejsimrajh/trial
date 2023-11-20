{
  inputs = {
    nixpkgs.url = "github:rvolosatovs/nixpkgs/init/cosmo";
    flake-utils.url = "flake-utils";
    fenix = {
      url = "fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, fenix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [
          (fenix.overlays.default)
          (self: super: {
            rust-toolchain = with fenix.packages.${system}; combine [
              minimal.cargo
              minimal.rustc
              targets.wasm32-unknown-unknown.latest.rust-std
            ];
          })
        ];
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rust-toolchain
            rust-analyzer-nightly
            cosmo
            infisical
          ];
        };
      }
    );
}