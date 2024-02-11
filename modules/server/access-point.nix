{ ... }: {
  services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "enp2s0";
      WIFI_IFACE = "wlp1s0";
      SSID = "home";
      PASSPHRASE = "FCKask4net";
    };
  };
}
