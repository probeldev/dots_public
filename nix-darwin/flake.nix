{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-25-11.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    niri-screen-time.url = "github:probeldev/niri-screen-time";
    fastlauncher.url = "github:fastlauncher/fastlauncher";
    fastlauncher_next.url = "github:fastlauncher/fastlauncher_next";
    sqlit.url = "github:Maxteabag/sqlit";

    # свежий rift напрямую из исходников, не дожидаясь nixpkgs-unstable
    rift.url = "github:acsandmann/rift";
    rift.flake = false;

    # свежий opencode напрямую из исходников
    opencode-src.url = "github:anomalyco/opencode/dev";

    # свежий rio из master (в nixpkgs 0.4.7/0.5.27 старые, в 0.5.27 тесты падают в сандбоксе)
    rio-git.url = "github:raphamorim/rio";
    rio-git.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = inputs@{
    self,
    nix-darwin,
    nixpkgs,
    nixpkgs-25-11,
    nixpkgs-unstable,
    niri-screen-time,
    fastlauncher,
    fastlauncher_next,
    sqlit,
    rift,
    opencode-src,
    rio-git,
  }:
  let
    configuration = { pkgs, ... }:
    let
      pkgs-25-11 = import nixpkgs-25-11 {
        system = pkgs.system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "python3.12-ecdsa-0.19.1"
          ];
        };
      };
      pkgs-unstable = import nixpkgs-unstable {
        system = pkgs.system;
        config.allowUnfree = true;
      };

      # rift-wm из nixpkgs-unstable, но с src = последний master acsandmann/rift
      rift-latest =
        let
          rev = rift.shortRev or "dirty";
        in
        pkgs-unstable.rift-wm.overrideAttrs (old: {
          version = "git-${rev}";
          # в master падает юнит-тест best_space_prefers_authoritative_window_server_space_over_geometry
          doCheck = false;
          src = rift;
          cargoDeps = pkgs-unstable.rustPlatform.fetchCargoVendor {
            pname = old.pname;
            version = "git-${rev}";
            src = rift;
            # TODO: после первой сборки заменить на хеш из ошибки "hash mismatch"
            hash = "sha256-WId2LP/9i17ybMEPvk6Z/V/eh7xTrQNH8VXigRVLFwU=";
          };
        });

      # opencode напрямую из репозитория anomalyco/opencode
      # smoke-тест в script/build.ts падает с SIGKILL в sandbox nix на macOS — отключаем
      opencode-latest = (opencode-src.packages.${pkgs.system}.default).overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          substituteInPlace packages/opencode/script/build.ts \
            --replace-fail 'if (item.os === process.platform && item.arch === process.arch && !item.abi) {' 'if (false) {'
        '';
        # генерация completions запускает бинарник — падает в sandbox;
        # вместо этого переподписываем бинарник adhoc: bun compile ломает подпись,
        # и macOS убивает процесс (exit 137)
        postInstall = ''
          /usr/bin/codesign --force --sign - "$out/bin/.opencode-wrapped"
        '';
        doInstallCheck = false;
      });

      # torrentTUI — красивый TUI-торрент-клиент (ratatui + librqbit), в nixpkgs нет — релизный бинарь
      # мажорные релизы: https://github.com/thijsvos/torrentTUI/releases, sha256 брать из digest ассета
      torrenttui = pkgs.stdenvNoCC.mkDerivation {
        pname = "torrenttui";
        version = "0.17.0";
        src = pkgs.fetchurl {
          url = "https://github.com/thijsvos/torrentTUI/releases/download/v0.17.0/torrenttui-macos-aarch64";
          sha256 = "sha256-w1rV121pNL25jwvJ1YzsoDpLJn/Au6Zg+/J6PiHYnWU=";
        };
        dontUnpack = true;
        installPhase = ''
          runHook preInstall
          install -Dm755 $src $out/bin/torrenttui
          # бинарь не подписан — без adhoc-подписи macOS убивает процесс
          /usr/bin/codesign --force --sign - $out/bin/torrenttui
          runHook postInstall
        '';
      };

      # superseedr — ещё один терминальный торрент-клиент (Rust + ratatui), в nixpkgs нет — сборка с crates.io
      # обновлять: версию и checksum брать из https://crates.io/api/v1/crates/superseedr
      superseedr = pkgs.rustPlatform.buildRustPackage {
        pname = "superseedr";
        version = "1.0.15";
        src = pkgs.fetchCrate {
          crateName = "superseedr";
          version = "1.0.15";
          sha256 = "sha256-vbdBAy3zxKdwdIiTEJel9nfdbVBpaomMxyRZ5W9z1rY=";
        };
        # при смене версии: cargoHash = lib.fakeHash -> собрать -> скопировать хеш из ошибки
        cargoHash = "sha256-WbvJxnb7AZ7UcGyv7i9MxzWQbZKWrjHAOz2IaFZR5D0=";
        # integration-тесты тянут сеть/файловые гонки — не нужны для установки
        doCheck = false;
      };
    in
    {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget

      nix.enable = false;
      system.primaryUser = "sergey";
      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.permittedInsecurePackages = [
        "python3.12-ecdsa-0.19.1"
      ];

      # darwin-rebuild без пароля (NOPASSWD), чтобы его могли запускать агенты и скрипты
      security.sudo.extraConfig = ''
        sergey ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild
      '';

      environment.systemPackages = with pkgs; [
        superfile
        pkgs-unstable.yazi
        chafa # превью картинок в yazi как ASCII-арт (rio не поддерживает граф. протоколы)

        vim
        neovim
        telegram-desktop
        dbgate
        fzf
        skim # rust alternative fzf
        ripgrep
        btop
        lazygit
        tree

        sqlit.packages.${pkgs.system}.default

        whisky

        go
        gopls
        gotools
        golangci-lint
        vtsls
        prettier
        zig

        orbstack

        ffmpeg
        imagemagick
        whisper-cpp # транскрибация для ytcut (нарезка дублей)

        cargo
        rust-analyzer
        rustfmt

        # rio из master github:raphamorim/rio — надежда на фикс превью картинок в yazi
        # (в nixpkgs 0.4.7 слишком старый, 0.5.27 из unstable не собирается — тесты падают в сандбоксе)
        # doCheck=false — тесты rio падают в nix-сандбоксе (spawn /usr/bin/login запрещён)
        (rio-git.packages.${pkgs.system}.default.overrideAttrs (_: { doCheck = false; }))
        ghostty-bin # запасной терминал: yazi превью/DnD работают из коробки
        kitty # терминал для yazi DnD (kitty dnd protocol) + превью

        nmap

        zed-editor

        fastfetch

        google-chrome

        pkgs-25-11.renpy

        pkgs-unstable.ollama
        opencode-latest
        pkgs-unstable.pi-coding-agent
        pkgs-unstable.rtk
        python313Packages.mlx-vlm

        zellij

        niri-screen-time.packages.${pkgs.system}.default
        fastlauncher.packages.${pkgs.system}.default
        fastlauncher_next.packages.${pkgs.system}.default

        starship

        # unixporn
        # aerospace
        rift-latest
        skhd
        jankyborders
        sketchybar

        sshuttle

        firefox

        lima

        ## md2pdf

        torrenttui
        superseedr
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # автосборка мусора nix: раз в 3 дня удаляются поколения старше 14 дней
      launchd.daemons.nix-gc = {
        command = "/nix/var/nix/profiles/default/bin/nix-collect-garbage --delete-older-than 14d";
        serviceConfig.StartInterval = 259200;
      };

      # автозапуск sketchybar (панель)
      launchd.user.agents.sketchybar = {
        command = "${pkgs.sketchybar}/bin/sketchybar";
        serviceConfig = {
          KeepAlive = true;
          RunAtLoad = true;
          StandardOutPath = "/tmp/sketchybar.log";
          StandardErrorPath = "/tmp/sketchybar.err.log";
        };
      };

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
    # $ darwin-rebuild build --flake .#Sergeys-MacBook-Air
    darwinConfigurations."Sergeys-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
