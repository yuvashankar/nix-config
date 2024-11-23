{
  #   security.rtkit.enable = false;
  # Disable pulseaudio if enabling pipewire
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  services.pipewire = {
    enable = false;
    alsa.enable = false;
    alsa.support32Bit = false;
    pulse.enable = false;
    # If you want to use JACK applications, uncomment this
    jack.enable = false;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
