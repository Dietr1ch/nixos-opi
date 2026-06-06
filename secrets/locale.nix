{ ... }:

# https://wiki.nixos.org/wiki/Locales

{
  # https://search.nixos.org/options?channel=unstable&query=i18n
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/config/i18n.nix
  # ~/Projects/systemn/system/base/locale.nix
  i18n = {
    # Default to en_IE.UTF-8/UTF-8
    defaultLocale = "en_IE.UTF-8";
    defaultCharset = "UTF-8";

    # NOTE: Has to be in this format: "de_DE.UTF-8/UTF-8"
    # (all others have to be in this format: "de_DE.UTF-8")
    extraLocales = [
      "C.UTF-8/UTF-8"

      "en_IE.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
      "LANG" = "en_IE.UTF-8";

      # POSIX
      # -----
      "LC_CTYPE" = "en_IE.UTF-8";
      "LC_COLLATE" = "en_IE.UTF-8";
      "LC_MESSAGES" = "en_IE.UTF-8";
      "LC_MONETARY" = "en_IE.UTF-8";
      "LC_NUMERIC" = "en_IE.UTF-8";
      "LC_TIME" = "en_IE.UTF-8";

      # Non-standard (Supported by glibc 2.2)
      # ------------
      "LC_ADDRESS" = "en_IE.UTF-8";
      "LC_IDENTIFICATION" = "en_IE.UTF-8";
      "LC_MEASUREMENT" = "en_IE.UTF-8";
      "LC_NAME" = "en_IE.UTF-8";
      "LC_PAPER" = "en_IE.UTF-8";
      "LC_TELEPHONE" = "en_IE.UTF-8";
    };
  };
}
