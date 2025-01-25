{
  inputs,
  pkgs,
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
    # Enable Bluettoth
    ../common/optional/bluetooth.nix
    # Enable pipewire audio
    # ../common/optional/pipewire.nix
    # Enable Pulse audio, mutually exclusive to pipewire
    ../common/optional/pulseaudio.nix
    # Add Desktop Environment
    ../common/optional/kde.nix
    # Enable Printing
    ../common/optional/printer.nix
    # Disable Suspend
    ../common/optional/disable_suspend.nix
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

  hardware.graphics = {
    enable = true;
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "Brother-HL-L2370DW";
        location = "Home";
        deviceUri = "ipp://192.168.2.10";
        model = "drv:///cupsfilters.drv/pwgrast.ppd";
      }
    ];
    ensureDefaultPrinter = "Brother-HL-L2370DW";
  };

  # Necessary for RPCS3
  security.pam.loginLimits = [
    {
      domain = "*";
      item = "memlock";
      type = "soft";
      value = "unlimited";
    }
    {
      domain = "*";
      item = "memlock";
      type = "hard";
      value = "unlimited";
    }
  ];

  # environment.systemPackages = [pkgs.kdePackages.partitionmanager];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
