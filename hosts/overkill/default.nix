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
    ../common/optional/nvidia

    # Enable audio
    ../common/optional/pipewire

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
    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
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

  # programs.firefox.enable = true;

  # # system-wide user settings (groups, etc).
  # users.users = {
  #   yuvashankar = {
  #     description = "Vinay Yuvashankar";
  #     # TODO: You can set an initial password for your user.
  #     # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
  #     # Be sure to change it (using passwd) after rebooting!
  #     initialPassword = "correcthorsebatterystaple";
  #     isNormalUser = true;
  #     openssh.authorizedKeys.keys = [
  #       # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
  #     ];
  #     # Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
  #     extraGroups = ["networkmanager" "wheel" "users"];
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
