# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ../features/productivity/common
  ];

  nixpkgs = {
    #     # You can add overlays here
    #     overlays = [
    #       # Add overlays your own flake exports (from overlays and pkgs dir):
    #       outputs.overlays.additions
    #       outputs.overlays.modifications
    #       outputs.overlays.unstable-packages

    #       # You can also add overlays exported from other flakes:
    #       # neovim-nightly-overlay.overlays.default

    #       # Or define it inline, for example:
    #       # (final: prev: {
    #       #   hi = final.hello.overrideAttrs (oldAttrs: {
    #       #     patches = [ ./change-hello-to-hi.patch ];
    #       #   });
    #       # })
    #     ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "yuvashankar";
    homeDirectory = "/home/yuvashankar";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # Browsers
    chromium
    firefox
    # Productivity
    libreoffice-qt
    sublime
    vim
    # Gaming
    steam
    gwe
    # neovim

    ## RPCS3 - also requires pulse audio for some reason.
    rpcs3
    dualsensectl
    nvtopPackages.full
    # For VSCodium
    alejandra
    # nixd
    nil
    direnv
    # KDE Packages
    ## Photo Viewer
    gwenview
    partition-manager
    kdePackages.kcalc
    libfido2
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  # programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName = "yuvashankar";
    userEmail = "vinay.yuvashankar@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
