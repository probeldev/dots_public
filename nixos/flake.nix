{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    fastlauncher.url = "github:probeldev/fastlauncher";
    niri-screen-time.url = "github:probeldev/niri-screen-time";
    unsplashwall.url = "github:probeldev/unsplash-wall";
    goaddtag.url = "github:probeldev/go-add-tag";
    gomultilineformatter.url = "github:probeldev/go-multiline-formatter";
    fastlauncher-niri-windows.url = "github:probeldev/fastlauncher-niri-windows";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    fastlauncher,
    niri-screen-time,
    unsplashwall,
    goaddtag,
    gomultilineformatter,
    fastlauncher-niri-windows,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
      specialArgs = {
        inherit home-manager fastlauncher niri-screen-time unsplashwall goaddtag gomultilineformatter fastlauncher-niri-windows; 
      };
    };
  };
}

