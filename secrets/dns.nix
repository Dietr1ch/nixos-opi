{ ... }:

{
  services = {
    # ./networking/connectivity/dns.nix
    adguardhome = {
      settings = {
        dns = {
          bootstrap_dns = [
            # AdGuard
            "94.140.14.14"

            # Cloudflare
            "1.1.1.1"
            "1.0.0.1"
            # Google
            "8.8.8.8"
            "8.8.4.4"
          ];
        };
        filters =
          map
            (url: {
              enabled = true;
              url = url;
            })
            [
              "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt" # The Big List of Hacked Malware Web Sites
              "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt" # malicious url blocklist

              "/var/dns_blacklist.txt"

              # blocklistproject AdGuard: https://github.com/blocklistproject/Lists/tree/master/adguard/
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/abuse-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/adobe-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/ads-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/basic-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/crypto-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/drugs-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/everything-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/facebook-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/fortnite-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/fraud-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/gambling-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/malware-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/phishing-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/piracy-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/porn-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/ransomware-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/redirect-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/scam-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/smart-tv-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/tiktok-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/torrent-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/tracking-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/twitter-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/vaping-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/whatsapp-ags.txt"
              "https://raw.githubusercontent.com/blocklistproject/Lists/raw/refs/heads/master/adguard/youtube-ags.txt"
            ];
      }; # ..services.adguardhome.settings
    }; # ..services.adguardhome

    # https://search.nixos.org/options?channel=unstable&query=services.dnscrypt-proxy
    # ./networking/connectivity/dns.nix
    dnscrypt-proxy = {
      # https://github.com/DNSCrypt/dnscrypt-proxy/tree/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
      # Generates /etc/systemd/system/dnscrypt-proxy.service
      settings = {
        sources = {
          public-resolvers = {
            cache_file = "/var/lib/dnscrypt-proxy/cache";
            urls = [
              "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
              "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            ];
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
          };
        };
      }; # ..services.dnscrypt-proxy.settings
    }; # ..services.dnscrypt-proxy
  }; # ..services
}
