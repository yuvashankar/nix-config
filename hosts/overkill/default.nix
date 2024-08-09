{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common/global
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    # For some reason nVidia Prime sync is enabled for common-gpu-nvidia
    # inputs.hardware.nixosModules.common-gpu-nvidia
    ../common/optional/nvidia.nix

    # Enable audio
    ../common/optional/pipewire.nix

    # Add Desktop Environment
    ../common/optional/kde.nix

    # Users
    ../common/users/yuvashankar
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "overkill";
    networkmanager.enable = true;
  };

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable the X11 windowing system.
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
