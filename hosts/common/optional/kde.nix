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
          enableHidpi = true;
          wayland.enable = true;
        };
      };
      xserver = {enable = false;};
    };
  };
}
