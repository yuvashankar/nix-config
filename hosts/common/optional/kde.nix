{
  config,
  pkgs,
  ...
}: {
  config = {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      xserver = {
        enable = true;
      };
    };
  };
}
