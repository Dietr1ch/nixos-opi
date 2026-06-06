{ ... }:

{
  # NOTE: This goes world-readable in the nix store
  services.grafana.settings.security.secret_key =
    "my-grafana-dashboard-is-quite-vulnerable-please-change-this";
}
