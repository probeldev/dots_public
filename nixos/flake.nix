{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    fastlauncher.url = "github:probeldev/fastlauncher";
    unsplashwall.url = "github:probeldev/unsplash-wall";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    fastlauncher,
    unsplashwall,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
      specialArgs = {
        inherit home-manager fastlauncher unsplashwall;
      };
    };
  };
}

