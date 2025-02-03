{
  description = "Centralized input hub for devenv projects";

  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
    devenv.url = "github:cachix/devenv";
  };

  outputs =
    inputs@{ self, ... }:
    {
      inputsHub = inputs;
    };
}
