{
  description = "Centralized input hub for devenv projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/b024ced1aac25639f8ca8fdfc2f8c4fbd66c48ef";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ self, ... }:
    {
      hub = inputs;
      templates =
        let
          simple = {
            path = ./templates/simple;
            description = "A simple devenv flake.nix example.";
          };
        in
        {
          default = simple;
        };
    };
}
