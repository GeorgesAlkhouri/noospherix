{
  description = "Centralized input hub for devenv projects";

  inputs = {
    # Base ecosystem inputs shared across noospherix consumers.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";

    # Shared Rosix inputs owned here so Rosix flakes can follow the hub.
    import-tree.url = "github:vic/import-tree";
    deploy-rs.url = "github:serokell/deploy-rs/77c906c0ba56aabdbc72041bf9111b565cdd6171";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "https://flakehub.com/f/nix-community/disko/*.tar.gz";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    wsl.url = "github:nix-community/NixOS-WSL";
    wsl.inputs.nixpkgs.follows = "nixpkgs";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixlib.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    determinate.inputs.nixpkgs.follows = "nixpkgs";

    caveman = {
      url = "github:JuliusBrussee/caveman";
      flake = false;
    };
    superpowers = {
      url = "github:obra/superpowers";
      flake = false;
    };
    opencode.url = "github:anomalyco/opencode?ref=v1.14.25";
  };

  outputs =
    inputs@{ ... }:
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
