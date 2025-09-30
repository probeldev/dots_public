{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    niri-screen-time.url = "github:probeldev/niri-screen-time";
    fastlauncher-niri-windows.url = "github:probeldev/fastlauncher-niri-windows";
  };

  outputs = inputs@{
  	self,
	nix-darwin,
	nixpkgs,
    niri-screen-time,
    fastlauncher,
	}:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      
      nix.enable = false;
      environment.systemPackages = with pkgs; [ 
	    skhd
		vim
		neovim
		tdesktop
		dbgate
		go
		gopls
		gotools
		fzf
		ripgrep
		btop

		
		iterm2
		alacritty


		aerospace

		zed-editor


		
		niri-screen-time.packages.${system}.default
		fastlauncher.packages.${system}.default
		starship
	];



		fonts.packages = with pkgs; [
		   nerd-fonts.fira-code
		];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#1s-MacBook-Air
    darwinConfigurations."1s-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
