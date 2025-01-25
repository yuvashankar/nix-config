{
  config,
  pkgs,
  ...
}: {
  config = {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager = {
        defaultSession = "plasma";
        sddm = {
          enable = true;
          enableHidpi = false;
          wayland.enable = true;
        };
      };
      xserver = {enable = false;};
    };
  };
}
