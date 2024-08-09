{
  config,
  pkgs,
  ...
}: {
  config = {
    services = {
      displayManager.sddm.enable = true;
      xserver = {
        desktopManager.plasma5.enable = true;
        enable = true;
      };
    };
  };
}
