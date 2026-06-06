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

  system.stateVersion = "26.05";
}
