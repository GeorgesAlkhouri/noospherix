{
  description = "Centralized input hub for devenv projects";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-devenv.url = "github:cachix/devenv-nixpkgs/rolling";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
    nixpkgs-python.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ self, ... }:
    {
      inputsHub = inputs;
    };
}
