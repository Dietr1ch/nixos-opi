{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git # used by nix flakes
      curl

      lm_sensors # `sensors`
      btop # monitor system resources

      # Peripherals
      mtdutils
      i2c-tools
      minicom
    ]; # ..environment.systemPackages
  }; # ..environment

  services = {
    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        X11Forwarding = true;
        PasswordAuthentication = true;
      };
    }; # ..services.openssh
  }; # ..services

  system.stateVersion = "26.05";
}
